package sadves

import chisel3._
import chisel3.util._
import scala.math._

class General_PE() extends Module {
  val io = IO(new Bundle {
    val col_in = Input(UInt(8.W))
    val col_out = Output(UInt(8.W))
    val row_in = Input(UInt(8.W))
    val row_out = Output(UInt(8.W))
    val out_in = Input(UInt(20.W))
    val out_out = Output(UInt(20.W))

    val flow_ctrl = Input(UInt(2.W))
    val out_ctrl = Input(UInt(1.W))
    //debug
    val debug = Output(Vec(2, UInt(20.W)))
  })
  
  val row = Reg(UInt(8.W))
  val col = Reg(UInt(8.W))
  
  io.row_out := row
  io.col_out := col
  
  val out0 = Reg(UInt(20.W))
  val out1 = Reg(UInt(20.W))

  val o_ctrl = io.out_ctrl
  val f_ctrl = io.flow_ctrl

  when(o_ctrl === 1.U) {
    io.out_out := out0
  }.otherwise {
    io.out_out := out1
  }
  
  //flow_control
  //0: reset
  //1: compute & data move
  //2: only data move
  when(f_ctrl === 0.U) {
    row  := 0.U
    col  := 0.U
    out0 := 0.U
    out1 := 0.U
  }.elsewhen(f_ctrl === 1.U) {
    row := io.row_in
    col := io.col_in
    
    when(o_ctrl === 0.U) {
      out0 := io.col_in * io.row_in + out0
      out1 := io.out_in
    }.otherwise {
      out1 := io.col_in * io.row_in + out1
      out0 := io.out_in
    }
  }.elsewhen(f_ctrl === 2.U) {
    row := io.row_in
    col := io.col_in
    
    when(o_ctrl === 1.U) {
      out0 := io.out_in
      out1 := out1
    }.otherwise {
      out1 := io.out_in
      out0 := out_0
    }
  }
  //debug
  io.debug(0) := out0
  io.debug(1) := out1
}
