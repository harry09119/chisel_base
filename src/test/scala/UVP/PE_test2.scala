package uvp_array

import org.scalatest._
import chiseltest._
import chisel3._
import chisel3.util._


class PE_Test2 extends FlatSpec with ChiselScalatestTester with Matchers {
  behavior of "General_PE"
  it should "produce right output" in {
    //Add your own functions here
    //Add your own values here
    test(
      new PE()
    ) { c =>
        // Prepare Data
        val col_A = for(i <- 0 to 15) yield i.U
        val row_B = for(i <- 0 to 15) yield i.U

        //Reset Register
        c.io.flow_index.poke(0.U(2.W))
        c.io.out_index.poke(0.U(1.W))
        c.clock.step(1)
        c.io.flow_index.poke(1.U(2.W))
        c.clock.step(1)

        // Send Data
        for(i <- 0 to 15) {
          c.io.col_in.poke(col_A(i))
          c.io.row_in.poke(row_B(i))
          c.clock.step(1)
          //println("["+i+"]:"+c.io.debug(0).peek()+"|"+c.io.debug(1).peek())
         
        }
        // Read HW's Outputs with "print(c.io.<HW OUTPUT PORT NAME>.peek())"
    }
  }
}
