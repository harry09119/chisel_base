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
    
    when(o_ctrl === 0.U) {
      out0 := io.col_in * io.row_in + out0
      out1 := out1
    }.otherwise {
      out1 := io.col_in * io.row_in + out1
      out0 := out0
    }
  }
  //debug
  io.debug(0) := out0
  io.debug(1) := out1
}

class Head_PE(global: Int) extends Module {
  val log2 = (x: Int) => (log10(x.toDouble)/log10(2.0)).toInt
  val io = IO(new Bundle {
    val col_in = Input(Vec(global, UInt(8.W)))
    val col_out = Output(UInt(8.W))
    val row_in = Input(UInt(8.W))
    val row_out = Output(UInt(8.W))
    val out_in = Input(UInt(20.W))
    val out_out = Output(UInt(20.W))

    val flow_ctrl = Input(UInt(2.W))
    val out_ctrl = Input(UInt(1.W))
    val col_ctrl = Input(UInt(log2(global).W))

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
  val c_ctrl = io.col_ctrl

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
    col := io.col_in(c_ctrl)
    
    when(o_ctrl === 0.U) {
      out0 := io.col_in(c_ctrl) * io.row_in + out0
      out1 := io.out_in
    }.otherwise {
      out1 := io.col_in(c_ctrl) * io.row_in + out1
      out0 := io.out_in
    }
  }.elsewhen(f_ctrl === 2.U) {
    row := io.row_in
    col := io.col_in(c_ctrl)
    
    when(o_ctrl === 0.U) {
      out0 := io.col_in(c_ctrl) * io.row_in + out0
      out1 := out1
    }.otherwise {
      out1 := io.col_in(c_ctrl) * io.row_in + out1
      out0 := out0
    }
  }
  //debug
  io.debug(0) := out0
  io.debug(1) := out1
}

class Group_PE(global: Int, vec: Int) extends Module {
  val log2 = (x: Int) => (log10(x.toDouble)/log10(2.0)).toInt
  val io = IO(new Bundle {
    val col_in = Input(Vec(global, UInt(8.W)))
    val col_out = Output(UInt(8.W))
    val row_in = Input(Vec(vec, UInt(8.W)))
    val row_out = Output(Vec(vec, UInt(8.W)))
    val out_in = Input(UInt(20.W))
    val out_out = Output(UInt(20.W))

    val flow_ctrl = Input(UInt(2.W))
    val out_ctrl = Input(UInt(1.W))
    val col_ctrl = Input(UInt(log2(global).W))

    //debug
    val debug = Output(Vec(vec, Vec(2, UInt(20.W))))
  })
  
  val Head = Module(new Head_PE(global))
  val Generals = for(i <- 0 until (vec - 1)) yield Module(new General_PE())
  io.col_out := Generals(vec - 2).io.col_out
  io.row_out(0) := Head.io.row_out
  for(i <- 1 until vec)
    io.row_out(i) := Generals(i-1).io.row_out

  //ctrl_connection
  Head.io.flow_ctrl := io.flow_ctrl
  for(i <- 0 until vec-1)
    Generals(i).io.flow_ctrl := io.flow_ctrl
  
  val o_ctrls = RegInit(VecInit(Seq.fill(vec)(0.U(1.W))))
  o_ctrls(0) := io.out_ctrl
  Head.io.out_ctrl := io.out_ctrl
  for (i <- 1 until vec) {
    o_ctrls(i) := o_ctrls(i-1)
    Generals(i-1).io.out_ctrl := o_ctrls(i-1)
  }

  Head.io.col_ctrl := io.col_ctrl

  //row_connection
  Head.io.row_in := io.row_in(0)
  for(i <- 1 until (vec))
    Generals(i-1).io.row_in := io.row_in(i)

  //column connection
  Head.io.col_in := io.col_in
  Generals(0).io.col_in := Head.io.col_out
  for(i <- 1 until (vec-1))
    Generals(i).io.col_in := Generals(i-1).io.col_out

  io.out_out := Head.io.out_out
  Head.io.out_in := Generals(0).io.out_out
  for(i <- 0 until (vec-2))
    Generals(i).io.out_in := Generals(i+1).io.out_out
  Generals(vec-2).io.out_in := io.out_in

  //debug
  io.debug(0)(0) := Head.io.debug(0)
  io.debug(0)(1) := Head.io.debug(1)
  for(i <- 1 until vec) {
    io.debug(i)(0) := Generals(i-1).io.debug(0)
    io.debug(i)(1) := Generals(i-1).io.debug(1)  
  }
}

class Column_PE(global: Int, vec: Int, group: Int) extends Module {
  val log2 = (x: Int) => (log10(x.toDouble)/log10(2.0)).toInt
  val io = IO(new Bundle {
    val col_in = Input(Vec(global, UInt(8.W)))
    val col_out = Output(UInt(8.W))
    val row_in = Input(Vec(group,Vec(vec, UInt(8.W))))
    val row_out = Output(Vec(group,Vec(vec, UInt(8.W))))
    val out_in = Input(UInt(20.W))
    val out_out = Output(UInt(20.W))

    val flow_ctrl = Input(UInt(2.W))
    val out_ctrl = Input(Vec(group, UInt(1.W)))
    val col_ctrl = Input(Vec(group, UInt(log2(global).W)))

    //debug
    val debug = Output(Vec(group,Vec(vec, Vec(2, UInt(20.W)))))
  })
  
  val Groups = for(i <- 0 until group) yield Module(new Group_PE(global,vec))
  
  io.out_out := Groups(0).io.out_out
  Groups(group-1).io.out_in := 0.U

  io.col_out := Groups(group-1).io.col_out

  for(i <- 0 until group) {
    io.row_out(i) := Groups(i).io.row_out

    Groups(i).io.col_in := io.col_in
    Groups(i).io.row_in := io.row_in(i)
    Groups(i).io.flow_ctrl := io.flow_ctrl
    Groups(i).io.out_ctrl := io.out_ctrl(i)
    Groups(i).io.col_ctrl := io.col_ctrl(i)
    
    if(i<group - 1) 
      Groups(i).io.out_in := Groups(i+1).io.out_out
  }

  //debug
  for(i <- 0 until group) {
    io.debug(i) := Groups(i).io.debug
  }
}
