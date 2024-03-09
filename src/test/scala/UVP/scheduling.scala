package uvp_array

import org.scalatest._
import chiseltest._
import chisel3._
import chisel3.util._
import scala.util.Random 
import scala.collection._

class TMP_Test extends FlatSpec with ChiselScalatestTester with Matchers {
  
  behavior of "HeadPE"
  it should "produce right output" in {
    //Add your own functions here
    //Add your own values here
    test(
      new PE()
    ) { c =>
        // Prepare Data
        val row_len = 16
        val col_len = 16
        val vec_len = 4
        val min_sparsity = 0.25
        val max_sparsity = 0.75
        val global_size = 4

        val tile_num = col_len / vec_len
        val min_num = row_len * min_sparsity
        val max_num = row_len * max_sparsity

        val col_index = for (i <- 0 to row_len - 1) yield i
        var tile_sizes = mutable.ListBuffer[Int]()

        for (i <- 0 until tile_num) {
          tile_sizes += (Random.nextInt((max_num-min_num).toInt) + min_num.toInt)
        }
        
        tile_sizes = tile_sizes.sorted

        val dense_avp = Array.ofDim[Int](col_len,row_len)
        val packed_avp = Array.ofDim[Int](col_len, tile_sizes(tile_num - 1))
        var packed_avp_index = Array.ofDim[Int](tile_num, tile_sizes(tile_num - 1))

        //format packed_avp_index to minus(None)
        for(i <- 0 until tile_num)
          for(j <- 0 until tile_sizes(tile_num - 1))
            packed_avp_index(i)(j) = -1

        //generate packed avp matrix
        for (i <- 0 until tile_num) {
          println("["+i+"]: "+tile_sizes(i))
          val nonzero_index = Random.shuffle(col_index).slice(0, tile_sizes(i)).sorted
          for (j <- 0 until tile_sizes(i)) {
            packed_avp_index(i)(j) = nonzero_index(j)
          }

          for (j <- col_index) {
            for (k <- 0 until vec_len) {
              if(nonzero_index.contains(j)) 
                dense_avp(i*vec_len+k)(j) = j+1//Random.nextInt(15) + 1
              else
                dense_avp(i*vec_len+k)(j) = 0
            }
          }
          for (j <- 0 until nonzero_index.length) {
            for(k <- 0 until vec_len) {
              packed_avp(i*vec_len+k)(j) = dense_avp(i*vec_len+k)(nonzero_index(j))
            }
          }
        }

        //generate all tile's input index list
        var all_input_index = mutable.ListBuffer[Int]()

        for(i <- 0 until tile_num) {
          for(row <- packed_avp_index) {
            for(j <- row)
              if(!all_input_index.contains(j) && j >= 0)
                all_input_index = all_input_index :+ j
          }
        }

        all_input_index = all_input_index.sorted
/*
        //seperate to unique and shared case
        var unique_avp_index = for(i <- 0 until tile_num) yield List[Int]()
        var shared_avp_index = for(i <- 0 until tile_num) yield List[Int]()

        for(inp <- all_input_index) {
          var where = List[Int]()
          for (tile <- 0 until tile_num) {
            var packed_tile = for (element <- 0 until tile_sizes(tile)) yield packed_avp_index(tile)(element)

            if(packed_tile.contains(inp)) {
              where = where :+ tile
            }
          }

          if(where.length > 1) {
            for(tile <- where)
              shared_avp_index = shared_avp_index.updated(tile,shared_avp_index(tile) :+ inp)
          }
          else {
            for(tile <- where)
             unique_avp_index = unique_avp_index.updated(tile,unique_avp_index(tile) :+ inp)
          }
        }
                
        println("shared: "+ shared_avp_index)
        println("unique: "+ unique_avp_index)
*/
        //reorder by tile's element interval in all tile's input list
        var pass = -1
        var count = 0
        while(pass != 0 && count < 5) {
          pass = 0
          count = count + 1
          //stop when fall in infinite loop
          if(count==5) 
            println("\n======IN LOOP=====\n")
          
          //reorder wgt and inp matrix
          for (tile <- 0 until tile_num) {            
            var one_tile_index = for (id <- 0 until tile_sizes(tile)) yield packed_avp_index(tile)(id)
            var index = 0
            for(inp_id <- all_input_index) {
              for(wgt_id <- one_tile_index) {
                if(inp_id == wgt_id && wgt_id >= 0) {
                  packed_avp_index(tile)(index) = wgt_id
                  index = index + 1
                }
              }
            }
            one_tile_index = for (id <- 0 until tile_sizes(tile)) yield packed_avp_index(tile)(id)

            //count interval of each tile's element
            var interval_list = List[Int]()
            var interval = 0
            for (element <- 1 until tile_sizes(tile)) {
              var prior = all_input_index.indexOf(packed_avp_index(tile)(element-1))
              var now = all_input_index.indexOf(packed_avp_index(tile)(element))
              interval = now - prior - 1
              interval_list = interval_list :+ interval
            }
            
            //change the order if the intervals are longer than "global register size - 1"
            for(src_id <- 0 until interval_list.length) {
              var interval_limit = global_size - 1
              var overhead = interval_list(src_id) - interval_limit
              if(interval_list(src_id) > interval_limit) {
                pass = 1
                var tmp = for (i <- 0 until tile_sizes(tile)) yield packed_avp_index(tile)(i) 

                var src_inp_range = mutable.ListBuffer[Int]()
                for ( range <- 0 until overhead) {
                  if((all_input_index.indexOf(packed_avp_index(tile)(src_id + 1)) + range) < all_input_index.length && packed_avp_index(tile)(src_id + 1) >= 0) {
                    src_inp_range = src_inp_range :+ all_input_index.indexOf(packed_avp_index(tile)(src_id + 1)) + range
                  }
                }

                var tmp2= for (range <- 0 until src_inp_range.length) yield all_input_index(src_inp_range(range))
                var src_start = src_inp_range(0)-overhead+src_inp_range.length
                var dst_start = src_inp_range(0)-overhead

                for (range <- overhead - 1 to 0 by -1) 
                  all_input_index(dst_start+range+src_inp_range.length) = all_input_index(dst_start+range)

                for (range <- 0 until src_inp_range.length)
                  all_input_index(dst_start+range) = tmp2(range)
              }
            }
            
            //sort each tile's index in order of input_index
            one_tile_index = for (id <- 0 until tile_sizes(tile)) yield packed_avp_index(tile)(id)
            index = 0
            for(inp_id <- all_input_index) {
              for(wgt_id <- one_tile_index) {
                if(inp_id == wgt_id && wgt_id >= 0) {
                  packed_avp_index(tile)(index) = wgt_id
                  index = index + 1
                }
              }
            }
            one_tile_index = for (id <- 0 until tile_sizes(tile)) yield packed_avp_index(tile)(id)
          }
        }

        //println("\nAfter Reordering\n")
        //println("all_tile_input: "+all_input_index)
        for (tile <- 0 until tile_num) {
          print("\n["+tile+"]:")
          for (id <- 0 until tile_sizes(tile)) yield print(packed_avp_index(tile)(id)+",")
        }

        println("\n[All Inp]:"+all_input_index)

        var input_expire_date = mutable.ListBuffer.fill(all_input_index.length)(0)
        var stalled_avp_index = Array.ofDim[Int](tile_num, tile_sizes(tile_num - 1))
        
        for ( ) {
          
        }

        var reshape_input_index = mutable.ListBuffer[Int]()
/*
        var tile_stall = List.fill(tile_num)(0)//for (t <- 0 until tile_num) yield 0
        println(tile_stall)

        for(end <- global_size until all_input_index.length) {
          var start = end - global_size
          var global_reg = for (reg <- start until end) yield all_input_index(reg)
//        println("\n["+start+"-on_regs]:"+global_reg)
//        println("["+start+"-stall]:"+tile_stall)
//        print("["+start+"-wgt]:")

          for (tile <- 0 until tile_num) {
            if (tile_sizes(tile) > start - tile_stall(tile)) {
              if(!global_reg.contains(packed_avp_index(tile)(start - tile_stall(tile))) && packed_avp_index(tile)(start - tile_stall(tile)) >= 0)
                tile_stall = tile_stall.updated(tile, tile_stall(tile) + 1)
            }
            else
              print("-1!,")
          }
        }
        
        println(tile_stall)

        val tiles_index = scala.collection.mutable.MutableList[Int]()
        for (i <- 0 until tile_num) {
          for(j <- 0 until tile_sizes(i)) 
          tiles_index += packed_avp(i*4)(j)
        }

        for(i <- 0 until col_len) {
          for (j <- 0 until row_len) {
            print(dense_avp(i)(j)+"|")
          }
          print("\n")
        }

        println("\n\n> Packed Index")
        for(i <- 0 until tile_num) {
          for (j <- 0 until tile_sizes(tile_num - 1)) {
            print(packed_avp_index(i)(j)+"|")
          }
          print("\n> ")
          for (j <- 1 until tile_sizes(i)) {
            var prior = all_input_index.indexOf(packed_avp_index(i)(j -1 ))
            var current = all_input_index.indexOf(packed_avp_index(i)(j))
            print(current - prior - 1 + "|")
          }
          print("\n\n")
        }

        println("\n> All Tile's Input Index")
        for(input <- all_input_index) {
            print(input+"|")
        }
        println(" ")

        println("\n> Output")
        for(i <- 0 until col_len) {
          for (j <- 0 until col_len) {
            print(dense_output(i)(j)+"|")
          }
          print("\n")
        }

 
        var dense_input = Array.ofDim[Int](col_len,row_len)

        for(i <- 0 until col_len) 
          for(j <- 0 until row_len)
            dense_input(i)(j) = j+1
        
        val dense_output = for (i <- 0 until col_len)
                            yield for (j <- 0 until col_len)
                              yield (for (k <- 0 until row_len) 
                                      yield dense_input(i)(k) * dense_avp(j)(k)
                                    ).reduce(_ + _)

*/
    println("Complete!")
    }
  }
}
