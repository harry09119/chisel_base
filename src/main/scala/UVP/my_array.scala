package uvp_array
//not used
import chisel3._
import chisel3.util._
import scala.math._

class HeadPE(window_size: Int) extends Module {
  val log2 = (x:Int) => (log10(x.toDouble)/log10(2.0)).toInt
  val io = IO(new Bundle {
    val col_in = Input(Vec(window_size ,UInt(8.W)))
    val col_out = Output(UInt(8.W))
    val row_in = Input(UInt(8.W))
    val row_out = Output(UInt(8.W))
    val out_in = Input(UInt(20.W))
    val out_out = Output(UInt(20.W))

    val flow_index = Input(UInt(2.W))
    val window_index = Input(UInt(log2(window_size).W))
    val out_index = Input(UInt(1.W))

    val debug = Output(Vec(2, UInt(20.W)))
  })

  val row_ = Reg(UInt(8.W))
  val col_ = Reg(UInt(8.W))
  
  io.row_out := row_
  io.col_out := col_

  val out_0 = Reg(UInt(20.W))
  val out_1 = Reg(UInt(20.W))

  when(io.out_index === 1.U) {
    io.out_out := out_0
  }.otherwise {
    io.out_out := out_1
  }
  io.debug(0) := out_0
  io.debug(1) := out_1

  when(io.flow_index === 0.U) {
    row_  := 0.U
    col_  := 0.U
    out_0 := 0.U
    out_1 := 0.U
  }.elsewhen(io.flow_index === 1.U) {
    row_ := io.row_in
    col_ := io.col_in(io.window_index)
    
    when(io.out_index === 0.U) {
      out_0 := io.col_in(io.window_index) * io.row_in + out_0
      out_1 := io.out_in
    }.otherwise {
      out_1 := io.col_in(io.window_index) * io.row_in + out_1
      out_0 := io.out_in
    }
  
  }.elsewhen(io.flow_index === 2.U) {
    row_ := io.row_in
    col_ := io.col_in(io.window_index)
    
    when(io.out_index === 0.U) {
      out_0 := io.col_in(io.window_index) * io.row_in + out_0
      out_1 := out_1
    }.otherwise {
      out_1 := io.col_in(io.window_index) * io.row_in + out_1
      out_0 := out_0
    }
  }
}

class PE() extends Module {
  val io = IO(new Bundle {
    val col_in = Input(UInt(8.W))
    val col_out = Output(UInt(8.W))
    val row_in = Input(UInt(8.W))
    val row_out = Output(UInt(8.W))
    val out_in = Input(UInt(20.W))
    val out_out = Output(UInt(20.W))

    val flow_index = Input(UInt(2.W))
    val out_index = Input(UInt(1.W))

    val debug = Output(Vec(2, UInt(20.W)))
  })
  
  val row_ = Reg(UInt(8.W))
  val col_ = Reg(UInt(8.W))
  
  io.row_out := row_
  io.col_out := col_

  val out_0 = Reg(UInt(20.W))
  val out_1 = Reg(UInt(20.W))

  when(io.out_index === 1.U) {
    io.out_out := out_0
  }.otherwise {
    io.out_out := out_1
  }
  io.debug(0) := out_0
  io.debug(1) := out_1

  when(io.flow_index === 0.U) {
    row_  := 0.U
    col_  := 0.U
    out_0 := 0.U
    out_1 := 0.U
  }.elsewhen(io.flow_index === 1.U) {
    row_ := io.row_in
    col_ := io.col_in
    
    when(io.out_index === 0.U) {
      out_0 := io.col_in * io.row_in + out_0
      out_1 := io.out_in
    }.otherwise {
      out_1 := io.col_in * io.row_in + out_1
      out_0 := io.out_in
    }
  }.elsewhen(io.flow_index === 2.U) {
    row_ := io.row_in
    col_ := io.col_in
    
    when(io.out_index === 0.U) {
      out_0 := io.col_in * io.row_in + out_0
      out_1 := out_1
    }.otherwise {
      out_1 := io.col_in * io.row_in + out_1
      out_0 := out_0
    }
  }

}

class PEGroup(window_size:Int, group_size:Int) extends Module {
  val log2 = (x:Int) => (log10(x.toDouble)/log10(2.0)).toInt
  val io = IO(new Bundle {
    val col_in = Input(Vec(window_size, UInt(8.W)))
    val row_in = Input(Vec(group_size, UInt(8.W)))
    val row_out = Output(Vec(group_size, UInt(8.W)))
    val out_in = Input(UInt(20.W))
    val out_out = Output(UInt(20.W))

    val window_index = Input(UInt(log2(window_size).W))
    val cmd = Input(Vec(group_size, UInt(3.W)))

    val debug = Output(Vec(group_size, Vec(2,UInt(20.W))))
  })

  val head = Module(new HeadPE(window_size))
  val body = for(i <- 0 to group_size-2) yield Module(new PE())
  
  io.out_out := head.io.out_out
  body(2).io.out_in := io.out_in
  for(i <- 0 to group_size - 1) {
    if(i == 0) {
      for(j <- 0 to window_size - 1) {
        head.io.col_in(j) := io.col_in(j)
      }
      head.io.row_in := io.row_in(i)
      io.row_out(i) := head.io.row_out
      head.io.window_index := io.window_index
      head.io.flow_index := io.cmd(i)(2,1)
      head.io.out_index := io.cmd(i)(0)
      io.debug(i)(0) := head.io.debug(0)
      io.debug(i)(1) := head.io.debug(1)
    }
    else if(i == 1) {
      body(i-1).io.col_in := head.io.col_out
      body(i-1).io.row_in := io.row_in(i)
      io.row_out(i) := body(i-1).io.row_out
      body(i-1).io.flow_index := io.cmd(i)(2,1)
      body(i-1).io.out_index := io.cmd(i)(0)
      head.io.out_in := body(i-1).io.out_out
      io.debug(i)(0) := body(i-1).io.debug(0)
      io.debug(i)(1) := body(i-1).io.debug(1)
    }
    else{
      body(i-1).io.col_in := body(i-2).io.col_out
      body(i-1).io.row_in := io.row_in(i)
      io.row_out(i) := body(i-1).io.row_out
      body(i-1).io.flow_index := io.cmd(i)(2,1)
      body(i-1).io.out_index := io.cmd(i)(0)
      body(i-2).io.out_in := body(i-1).io.out_out
      io.debug(i)(0) := body(i-1).io.debug(0)
      io.debug(i)(1) := body(i-1).io.debug(1)
    }
  }
}

class Array_Col (window_size:Int, group_size:Int, group_num:Int) extends Module {
  val log2 = (x:Int) => (log10(x.toDouble)/log10(2.0)).toInt
  val io = IO(new Bundle {
    val col_in = Input(Vec(window_size, UInt(8.W)))
    val row_in = Input(Vec(group_size*group_num, UInt(8.W)))
    val row_out = Output(Vec(group_size*group_num, UInt(8.W)))
    val out_in = Input(UInt(20.W))
    val out_out = Output(UInt(20.W))

    val window_index = Input(Vec(group_num, UInt(log2(window_size).W)))
    val cmd = Input(Vec(group_size*group_num, UInt(3.W)))

    val debug = Output(Vec(group_size*group_num, Vec(2,UInt(20.W))))
  })
  
  val groups = for(i <- 1 to group_num) yield Module(new PEGroup(window_size,group_size))
  for(i <- 0 to group_num-1) {
    for(j <- 0 to window_size-1){
      groups(i).io.col_in(j) := io.col_in(j)
    }
    for(j<-0 to group_size-1){
      groups(i).io.row_in(j) := io.row_in(i*group_size+j)
      io.row_out(i*group_size + j) := groups(i).io.row_out(j)
      groups(i).io.cmd(j) := io.cmd(i*group_size+j)
      io.debug(i*group_size+j) := groups(i).io.debug(j)
    }
    groups(i).io.window_index := io.window_index(i)

    if(i==0)
      io.out_out := groups(i).io.out_out
    else
      groups(i-1).io.out_in := groups(i).io.out_out
  }
  groups(group_num-1).io.out_in := 0.U
}

