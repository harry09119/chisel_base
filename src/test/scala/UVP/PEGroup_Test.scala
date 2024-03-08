package uvp_array

import org.scalatest._
import chiseltest._
import chisel3._
import chisel3.util._


class PEGroup_Test extends FlatSpec with ChiselScalatestTester with Matchers {
  behavior of "HeadPE"
  it should "produce right output" in {
    //Add your own functions here
    //Add your own values here
    test(
      new PEGroup(4,4)
    ) { c =>
        // Prepare Data
        val col_A = for(i <- 0 to 15) yield for(j <- 0 to 3) yield j.U
        val row_A = for(i <- 0 to 15) yield for(j <- 0 to 3) yield i.U
        val col_B = for(i <- 0 to 15) yield for(j <- 0 to 3) yield (3-j).U
        val row_B = for(i <- 0 to 15) yield for(j <- 0 to 3) yield (15-i).U

        //Reset Register
        for(i <- 0 to 3)
          c.io.cmd(i).poke(0.U(3.W))
        c.clock.step(1)
        for(i <- 0 to 3)
          c.io.cmd(i).poke(2.U(3.W))
        c.clock.step(1)

        // Send Data
        for(i <- 0 to 35) {
          for(j <- 0 to 3) {
            
            if(i < 16)
              c.io.col_in(j).poke(col_A(i)(j))
            else if(i >= 16 && i < 32)
              c.io.col_in(j).poke(col_B(i-16)(j))
            else
              c.io.col_in(j).poke(0.U)

            if(i < (16 + j) && i >= j)
              c.io.row_in(j).poke(row_A(i-j)(j))
            else if(i >= (16 + j) && i <= (31 + j)) {
              c.io.row_in(j).poke(row_B(i - 16 - j)(j))
              c.io.cmd(j).poke(3.U)
            }
            else
              c.io.row_in(j).poke(0.U)
            
            c.io.window_index.poke(1.U(2.W))

          }
          c.clock.step(1)
          for(j <- 0 to 0)
            println("\n=======\n["+i+"|"+j+"]:"+c.io.debug(j)(0).peek()+"|"+c.io.debug(j)(1).peek())
         
        }
        // Read HW's Outputs with "print(c.io.<HW OUTPUT PORT NAME>.peek())"

    }
  }
}
