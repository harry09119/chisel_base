package sadves

import org.scalatest._
import chiseltest._
import chisel3._
import chisel3.util._
import scala.collection.mutable

class Column_PE_Test extends FlatSpec with ChiselScalatestTester with Matchers {
  behavior of "Column_PE" 
  it should "produce right output" in {
    //Add your own functions here
    //Add your own values here
    val global = 4
    val vec = 2
    val len = 8
    val group = 4
    test(
      new Column_PE(global,vec,group)
    ) { c =>
        // Prepare Data
        var Mat_A = for(i <- 0 until len) yield for(j <- 0 until global) yield i
        var Mat_B = for(i <- 0 until len) yield for(j <- 0 until vec * group) yield j
        
        val rand = new scala.util.Random
        val o_ctrl = for(i <- 0 until len) yield for(j <- 0 until group) yield rand.nextInt(2)
        val c_ctrl = for(i <- 0 until len) yield for(j <- 0 until group) yield rand.nextInt(global)
        println("OC:"+o_ctrl)
        println("CC:"+c_ctrl)

        var outs = Array.fill(vec*group,2) {0}
          //for(i<- 0 until vec) yield for(j <- 0 until 2) yield 0
        var mul = 0
        for(i <- 0 until len) {
          for(k <- 0 until group) {
            for(j <- 0 until vec) {
              mul =  Mat_A(i)(c_ctrl(i)(k)) * Mat_B(i)(k*vec + j)
              if(o_ctrl(i)(k) == 0)
                outs(k*vec + j)(0) = outs(k*vec+j)(0) + mul
              else
                outs(k*vec + j)(1) = outs(k*vec+j)(1) + mul
            }
          }
        }

        for(i<-0 until vec*group) {
          println(i+"> "+"[0]:"+outs(i)(0)+" | "+"[1]:"+outs(i)(1))
        }

        //Reset Register
        c.io.flow_ctrl.poke(0.U(2.W))
        c.clock.step(1)
        c.io.flow_ctrl.poke(2.U(2.W))
        c.clock.step(1)

        // Send Data
        for(i <- 0 until len + vec) {

          for(j <- 0 until global) {
            if(i < len)
              c.io.col_in(j).poke(Mat_A(i)(j).asUInt(8.W))
            else
              c.io.col_in(j).poke(0.asUInt(8.W))
          }
          for (k <- 0 until group) {
            
            for(j <- 0 until vec) {
              if(i < j || i >= j + len)
                c.io.row_in(k)(j).poke(0.asUInt(8.W))
              else
                c.io.row_in(k)(j).poke(Mat_B(i-j)(vec*k + j).asUInt(8.W))
            }
            
            if(i<len) {
              c.io.out_ctrl(k).poke(o_ctrl(i)(k).asUInt)
              c.io.col_ctrl(k).poke(c_ctrl(i)(k).asUInt)
            }
            

          }
          c.clock.step(1)
/*          
          println("<=="+i+"==>")
          //println(for(j<-0 until group) yield Mat_A(i)(c_ctrl(i)(j)))
          //println(for(j<- 0 until vec*group) yield Mat_B(i)(j))
          for(k <- 0 until group)
            for(i<-0 until vec) 
              println(i+"> "+"Real [0]:"+c.io.debug(k)(i)(0).peek()+" | "+"[1]:"+c.io.debug(k)(i)(1).peek())   
*/          
        }
        // Read HW's Outputs with "print(c.io.<HW OUTPUT PORT NAME>.peek())"
        println("<==FINAL==>")
        for(k <- 0 until group)
          for(i<-0 until vec) 
            println(i+"> "+"Real [0]:"+c.io.debug(k)(i)(0).peek()+" | "+"[1]:"+c.io.debug(k)(i)(1).peek())
          
    }
  }
}
