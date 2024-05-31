package sadves

import org.scalatest._
import chiseltest._
import chisel3._
import chisel3.util._
import scala.collection.mutable

class Group_PE_Test extends FlatSpec with ChiselScalatestTester with Matchers {
  behavior of "Head_PE" 
  it should "produce right output" in {
    //Add your own functions here
    //Add your own values here
    val global = 4
    val vec = 8
    val len = 4
    test(
      new Group_PE(global,vec)
    ) { c =>
        // Prepare Data
        val Mat_A = for(i <- 0 until len) yield for(j <- 0 until global) yield i + j
        val Mat_B = for(i <- 0 until len) yield for(j <- 0 until vec) yield i + j
        
        val rand = new scala.util.Random
        val o_ctrl = for(i <- 0 until len) yield rand.nextInt(2)
        val c_ctrl = for(i <- 0 until len) yield rand.nextInt(global)
        println("OC:"+o_ctrl)
        println("CC:"+c_ctrl)

        var outs = Array.fill(vec,2) {0}
          //for(i<- 0 until vec) yield for(j <- 0 until 2) yield 0
        var mul = 0
        for(i <- 0 until len) {
          for(j <- 0 until vec) {
            mul =  Mat_A(i)(c_ctrl(i)) * Mat_B(i)(j)
            if(o_ctrl(i) == 0)
              outs(j)(0) = outs(j)(0) + mul
            else
              outs(j)(1) = outs(j)(1) + mul
          }
        }

        for(i<-0 until vec) {
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
          for(j <- 0 until vec) {
            if(i < j || i >= j + len)
              c.io.row_in(j).poke(0.asUInt(8.W))
            else
              c.io.row_in(j).poke(Mat_B(i-j)(j).asUInt(8.W))
          }
          if(i<len) {
            c.io.out_ctrl.poke(o_ctrl(i).asUInt)
            c.io.col_ctrl.poke(c_ctrl(i).asUInt)
          }
          c.clock.step(1)
/*
          println("<=="+i+"==>")
          println(Mat_A(i)(c_ctrl(i)))
          println(for(j<- 0 until vec) yield Mat_B(i)(j))
          for(j<-0 until vec) {
            println(j+"> "+"Real [0]:"+c.io.debug(j)(0).peek()+" | "+"[1]:"+c.io.debug(j)(1).peek())
          }
*/          
        }
        // Read HW's Outputs with "print(c.io.<HW OUTPUT PORT NAME>.peek())"
        for(i<-0 until vec) {
          println(i+"> "+"Real [0]:"+c.io.debug(i)(0).peek()+" | "+"[1]:"+c.io.debug(i)(1).peek())
        }
    }
  }
}
