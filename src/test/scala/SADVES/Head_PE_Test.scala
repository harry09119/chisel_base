package sadves

import org.scalatest._
import chiseltest._
import chisel3._
import chisel3.util._

class Head_PE_Test extends FlatSpec with ChiselScalatestTester with Matchers {
  behavior of "Head_PE" 
  it should "produce right output" in {
    //Add your own functions here
    //Add your own values here
    val global = 4
    test(
      new Head_PE(global)
    ) { c =>
        // Prepare Data
        val Mat_A = for(i <- 0 until 15) yield for(j <- 0 until global) yield i + j
        val Mat_B = for(i <- 0 until 15) yield i
        
        val rand = new scala.util.Random
        val o_ctrl = for(i <- 0 until 15) yield rand.nextInt(2)
        val c_ctrl = for(i <- 0 until 15) yield rand.nextInt(4)
        println("OC:"+o_ctrl)
        println("CC:"+c_ctrl)

        var out0 = 0
        var out1 = 0
        var mul = 0
        for(i <- 0 until 15) {
          mul =  Mat_A(i)(c_ctrl(i)) * Mat_B(i)
          if(o_ctrl(i) == 0)
            out0 = out0 + mul
          else
            out1 = out1 + mul
        }
        println("[0]:"+out0+" | "+"[1]:"+out1)

        //Reset Register
        c.io.flow_ctrl.poke(0.U(2.W))
        c.clock.step(1)
        c.io.flow_ctrl.poke(2.U(2.W))
        c.clock.step(1)

        // Send Data
        for(i <- 0 until 15) {
          for(j <- 0 until global)
            c.io.col_in(j).poke(Mat_A(i)(j).asUInt(8.W))
          c.io.row_in.poke(Mat_B(i).asUInt(8.W))
          c.io.out_ctrl.poke(o_ctrl(i).asUInt)
          c.io.col_ctrl.poke(c_ctrl(i).asUInt)
          c.clock.step(1)
          //println("["+i+"]:"+c.io.debug(0).peek()+"|"+c.io.debug(1).peek())
        }
        // Read HW's Outputs with "print(c.io.<HW OUTPUT PORT NAME>.peek())"
        println("Real Out[0]:"+c.io.debug(0).peek()+" | Out[1]:"+c.io.debug(1).peek())

    }
  }
}
