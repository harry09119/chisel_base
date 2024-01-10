package base

import org.scalatest._
import chiseltest._
import chisel3._
import chisel3.util._


class BaseTest extends FlatSpec with ChiselScalatestTester with Matchers {
  behavior of "Base"
  it should "produce right output" in {
    //Add your own functions here
    //Add your own values here
    test(
      new Base(
        //Add your HW's options here
      )
    ) { c =>
        // Prepare Data
        
        // Send data to your HW's IO ports with "c.io.<HW INPUT PORT NAME>.poke(<YOUR DATA NAME>)"
        
        // Apply clock with "c.clock.step(<CYCLE NUM>)"
        
        // Read HW's Outputs with "print(c.io.<HW OUTPUT PORT NAME>.peek())"
    }
  }
}
