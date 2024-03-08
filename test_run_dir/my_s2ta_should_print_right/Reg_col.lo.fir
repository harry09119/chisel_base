circuit Reg_col :
  module Regs :
    input clock : Clock
    input reset : UInt<1>
    input io_r_in : UInt<8>
    input io_c1_in : UInt<8>
    input io_c2_in : UInt<8>
    output io_r_out : UInt<8>
    output io_c1_out : UInt<8>
    output io_c2_out : UInt<8>
    input io_c_state : UInt<3>
    input io_d_state : UInt<2>
    output io_debug : UInt<32>

    reg reg1 : UInt<20>, clock with :
      reset => (UInt<1>("h0"), reg1) @[custum_array.scala 93:17]
    reg reg2 : UInt<20>, clock with :
      reset => (UInt<1>("h0"), reg2) @[custum_array.scala 94:17]
    node _T = eq(io_c_state, UInt<3>("h0")) @[custum_array.scala 100:19]
    node _T_1 = eq(io_c_state, UInt<3>("h1")) @[custum_array.scala 103:25]
    node _T_2 = eq(io_c_state, UInt<3>("h2")) @[custum_array.scala 106:25]
    node _T_3 = eq(io_c_state, UInt<3>("h3")) @[custum_array.scala 109:25]
    node _GEN_0 = mux(_T_3, reg1, reg2) @[custum_array.scala 109:39 custum_array.scala 110:10 custum_array.scala 114:10]
    node _GEN_1 = mux(_T_3, reg1, reg1) @[custum_array.scala 109:39 custum_array.scala 111:10 custum_array.scala 113:10]
    node _GEN_2 = mux(_T_2, io_c1_in, _GEN_1) @[custum_array.scala 106:39 custum_array.scala 107:10]
    node _GEN_3 = mux(_T_2, io_c2_in, _GEN_0) @[custum_array.scala 106:39 custum_array.scala 108:10]
    node _GEN_4 = mux(_T_1, io_r_in, _GEN_2) @[custum_array.scala 103:39 custum_array.scala 104:10]
    node _GEN_5 = mux(_T_1, io_c2_in, _GEN_3) @[custum_array.scala 103:39 custum_array.scala 105:10]
    node _GEN_6 = mux(_T, UInt<1>("h0"), _GEN_4) @[custum_array.scala 100:33 custum_array.scala 101:10]
    node _GEN_7 = mux(_T, UInt<1>("h0"), _GEN_5) @[custum_array.scala 100:33 custum_array.scala 102:10]
    node _T_4 = eq(io_d_state, UInt<2>("h2")) @[custum_array.scala 117:19]
    node _T_5 = eq(io_d_state, UInt<2>("h3")) @[custum_array.scala 119:25]
    node _GEN_8 = mux(_T_5, reg2, UInt<1>("h0")) @[custum_array.scala 119:39 custum_array.scala 120:14 custum_array.scala 122:14]
    node _GEN_9 = mux(_T_4, reg1, _GEN_8) @[custum_array.scala 117:33 custum_array.scala 118:14]
    io_r_out <= bits(reg1, 7, 0) @[custum_array.scala 96:12]
    io_c1_out <= bits(reg1, 7, 0) @[custum_array.scala 97:13]
    io_c2_out <= bits(reg2, 7, 0) @[custum_array.scala 98:13]
    io_debug <= _GEN_9
    reg1 <= _GEN_6
    reg2 <= _GEN_7

  module Reg_col :
    input clock : Clock
    input reset : UInt<1>
    input io_r_in_0 : UInt<8>
    input io_r_in_1 : UInt<8>
    input io_r_in_2 : UInt<8>
    input io_r_in_3 : UInt<8>
    input io_r_in_4 : UInt<8>
    input io_r_in_5 : UInt<8>
    input io_r_in_6 : UInt<8>
    input io_r_in_7 : UInt<8>
    input io_r_in_8 : UInt<8>
    input io_r_in_9 : UInt<8>
    input io_r_in_10 : UInt<8>
    input io_r_in_11 : UInt<8>
    input io_r_in_12 : UInt<8>
    input io_r_in_13 : UInt<8>
    input io_r_in_14 : UInt<8>
    input io_r_in_15 : UInt<8>
    input io_c1_in : UInt<8>
    input io_c2_in : UInt<8>
    output io_r_out_0 : UInt<8>
    output io_r_out_1 : UInt<8>
    output io_r_out_2 : UInt<8>
    output io_r_out_3 : UInt<8>
    output io_r_out_4 : UInt<8>
    output io_r_out_5 : UInt<8>
    output io_r_out_6 : UInt<8>
    output io_r_out_7 : UInt<8>
    output io_r_out_8 : UInt<8>
    output io_r_out_9 : UInt<8>
    output io_r_out_10 : UInt<8>
    output io_r_out_11 : UInt<8>
    output io_r_out_12 : UInt<8>
    output io_r_out_13 : UInt<8>
    output io_r_out_14 : UInt<8>
    output io_r_out_15 : UInt<8>
    output io_c1_out : UInt<8>
    output io_c2_out : UInt<8>
    input io_c_state : UInt<3>
    input io_d_state : UInt<2>
    output io_debug_0 : UInt<32>
    output io_debug_1 : UInt<32>
    output io_debug_2 : UInt<32>
    output io_debug_3 : UInt<32>
    output io_debug_4 : UInt<32>
    output io_debug_5 : UInt<32>
    output io_debug_6 : UInt<32>
    output io_debug_7 : UInt<32>
    output io_debug_8 : UInt<32>
    output io_debug_9 : UInt<32>
    output io_debug_10 : UInt<32>
    output io_debug_11 : UInt<32>
    output io_debug_12 : UInt<32>
    output io_debug_13 : UInt<32>
    output io_debug_14 : UInt<32>
    output io_debug_15 : UInt<32>

    inst regs_0 of Regs @[custum_array.scala 141:56]
    inst regs_1 of Regs @[custum_array.scala 141:56]
    inst regs_2 of Regs @[custum_array.scala 141:56]
    inst regs_3 of Regs @[custum_array.scala 141:56]
    inst regs_4 of Regs @[custum_array.scala 141:56]
    inst regs_5 of Regs @[custum_array.scala 141:56]
    inst regs_6 of Regs @[custum_array.scala 141:56]
    inst regs_7 of Regs @[custum_array.scala 141:56]
    inst regs_8 of Regs @[custum_array.scala 141:56]
    inst regs_9 of Regs @[custum_array.scala 141:56]
    inst regs_10 of Regs @[custum_array.scala 141:56]
    inst regs_11 of Regs @[custum_array.scala 141:56]
    inst regs_12 of Regs @[custum_array.scala 141:56]
    inst regs_13 of Regs @[custum_array.scala 141:56]
    inst regs_14 of Regs @[custum_array.scala 141:56]
    inst regs_15 of Regs @[custum_array.scala 141:56]
    io_r_out_0 <= regs_0.io_r_out @[custum_array.scala 148:17]
    io_r_out_1 <= regs_1.io_r_out @[custum_array.scala 148:17]
    io_r_out_2 <= regs_2.io_r_out @[custum_array.scala 148:17]
    io_r_out_3 <= regs_3.io_r_out @[custum_array.scala 148:17]
    io_r_out_4 <= regs_4.io_r_out @[custum_array.scala 148:17]
    io_r_out_5 <= regs_5.io_r_out @[custum_array.scala 148:17]
    io_r_out_6 <= regs_6.io_r_out @[custum_array.scala 148:17]
    io_r_out_7 <= regs_7.io_r_out @[custum_array.scala 148:17]
    io_r_out_8 <= regs_8.io_r_out @[custum_array.scala 148:17]
    io_r_out_9 <= regs_9.io_r_out @[custum_array.scala 148:17]
    io_r_out_10 <= regs_10.io_r_out @[custum_array.scala 148:17]
    io_r_out_11 <= regs_11.io_r_out @[custum_array.scala 148:17]
    io_r_out_12 <= regs_12.io_r_out @[custum_array.scala 148:17]
    io_r_out_13 <= regs_13.io_r_out @[custum_array.scala 148:17]
    io_r_out_14 <= regs_14.io_r_out @[custum_array.scala 148:17]
    io_r_out_15 <= regs_15.io_r_out @[custum_array.scala 148:17]
    io_c1_out <= regs_15.io_c1_out @[custum_array.scala 158:17]
    io_c2_out <= regs_15.io_c2_out @[custum_array.scala 159:17]
    io_debug_0 <= regs_0.io_debug @[custum_array.scala 149:17]
    io_debug_1 <= regs_1.io_debug @[custum_array.scala 149:17]
    io_debug_2 <= regs_2.io_debug @[custum_array.scala 149:17]
    io_debug_3 <= regs_3.io_debug @[custum_array.scala 149:17]
    io_debug_4 <= regs_4.io_debug @[custum_array.scala 149:17]
    io_debug_5 <= regs_5.io_debug @[custum_array.scala 149:17]
    io_debug_6 <= regs_6.io_debug @[custum_array.scala 149:17]
    io_debug_7 <= regs_7.io_debug @[custum_array.scala 149:17]
    io_debug_8 <= regs_8.io_debug @[custum_array.scala 149:17]
    io_debug_9 <= regs_9.io_debug @[custum_array.scala 149:17]
    io_debug_10 <= regs_10.io_debug @[custum_array.scala 149:17]
    io_debug_11 <= regs_11.io_debug @[custum_array.scala 149:17]
    io_debug_12 <= regs_12.io_debug @[custum_array.scala 149:17]
    io_debug_13 <= regs_13.io_debug @[custum_array.scala 149:17]
    io_debug_14 <= regs_14.io_debug @[custum_array.scala 149:17]
    io_debug_15 <= regs_15.io_debug @[custum_array.scala 149:17]
    regs_0.clock <= clock
    regs_0.reset <= reset
    regs_0.io_r_in <= io_r_in_0 @[custum_array.scala 144:21]
    regs_0.io_c1_in <= io_c1_in @[custum_array.scala 156:24]
    regs_0.io_c2_in <= io_c2_in @[custum_array.scala 157:24]
    regs_0.io_c_state <= io_c_state @[custum_array.scala 145:24]
    regs_0.io_d_state <= io_d_state @[custum_array.scala 146:24]
    regs_1.clock <= clock
    regs_1.reset <= reset
    regs_1.io_r_in <= io_r_in_1 @[custum_array.scala 144:21]
    regs_1.io_c1_in <= regs_0.io_c1_out @[custum_array.scala 152:24]
    regs_1.io_c2_in <= regs_0.io_c2_out @[custum_array.scala 153:24]
    regs_1.io_c_state <= io_c_state @[custum_array.scala 145:24]
    regs_1.io_d_state <= io_d_state @[custum_array.scala 146:24]
    regs_2.clock <= clock
    regs_2.reset <= reset
    regs_2.io_r_in <= io_r_in_2 @[custum_array.scala 144:21]
    regs_2.io_c1_in <= regs_1.io_c1_out @[custum_array.scala 152:24]
    regs_2.io_c2_in <= regs_1.io_c2_out @[custum_array.scala 153:24]
    regs_2.io_c_state <= io_c_state @[custum_array.scala 145:24]
    regs_2.io_d_state <= io_d_state @[custum_array.scala 146:24]
    regs_3.clock <= clock
    regs_3.reset <= reset
    regs_3.io_r_in <= io_r_in_3 @[custum_array.scala 144:21]
    regs_3.io_c1_in <= regs_2.io_c1_out @[custum_array.scala 152:24]
    regs_3.io_c2_in <= regs_2.io_c2_out @[custum_array.scala 153:24]
    regs_3.io_c_state <= io_c_state @[custum_array.scala 145:24]
    regs_3.io_d_state <= io_d_state @[custum_array.scala 146:24]
    regs_4.clock <= clock
    regs_4.reset <= reset
    regs_4.io_r_in <= io_r_in_4 @[custum_array.scala 144:21]
    regs_4.io_c1_in <= regs_3.io_c1_out @[custum_array.scala 152:24]
    regs_4.io_c2_in <= regs_3.io_c2_out @[custum_array.scala 153:24]
    regs_4.io_c_state <= io_c_state @[custum_array.scala 145:24]
    regs_4.io_d_state <= io_d_state @[custum_array.scala 146:24]
    regs_5.clock <= clock
    regs_5.reset <= reset
    regs_5.io_r_in <= io_r_in_5 @[custum_array.scala 144:21]
    regs_5.io_c1_in <= regs_4.io_c1_out @[custum_array.scala 152:24]
    regs_5.io_c2_in <= regs_4.io_c2_out @[custum_array.scala 153:24]
    regs_5.io_c_state <= io_c_state @[custum_array.scala 145:24]
    regs_5.io_d_state <= io_d_state @[custum_array.scala 146:24]
    regs_6.clock <= clock
    regs_6.reset <= reset
    regs_6.io_r_in <= io_r_in_6 @[custum_array.scala 144:21]
    regs_6.io_c1_in <= regs_5.io_c1_out @[custum_array.scala 152:24]
    regs_6.io_c2_in <= regs_5.io_c2_out @[custum_array.scala 153:24]
    regs_6.io_c_state <= io_c_state @[custum_array.scala 145:24]
    regs_6.io_d_state <= io_d_state @[custum_array.scala 146:24]
    regs_7.clock <= clock
    regs_7.reset <= reset
    regs_7.io_r_in <= io_r_in_7 @[custum_array.scala 144:21]
    regs_7.io_c1_in <= regs_6.io_c1_out @[custum_array.scala 152:24]
    regs_7.io_c2_in <= regs_6.io_c2_out @[custum_array.scala 153:24]
    regs_7.io_c_state <= io_c_state @[custum_array.scala 145:24]
    regs_7.io_d_state <= io_d_state @[custum_array.scala 146:24]
    regs_8.clock <= clock
    regs_8.reset <= reset
    regs_8.io_r_in <= io_r_in_8 @[custum_array.scala 144:21]
    regs_8.io_c1_in <= regs_7.io_c1_out @[custum_array.scala 152:24]
    regs_8.io_c2_in <= regs_7.io_c2_out @[custum_array.scala 153:24]
    regs_8.io_c_state <= io_c_state @[custum_array.scala 145:24]
    regs_8.io_d_state <= io_d_state @[custum_array.scala 146:24]
    regs_9.clock <= clock
    regs_9.reset <= reset
    regs_9.io_r_in <= io_r_in_9 @[custum_array.scala 144:21]
    regs_9.io_c1_in <= regs_8.io_c1_out @[custum_array.scala 152:24]
    regs_9.io_c2_in <= regs_8.io_c2_out @[custum_array.scala 153:24]
    regs_9.io_c_state <= io_c_state @[custum_array.scala 145:24]
    regs_9.io_d_state <= io_d_state @[custum_array.scala 146:24]
    regs_10.clock <= clock
    regs_10.reset <= reset
    regs_10.io_r_in <= io_r_in_10 @[custum_array.scala 144:21]
    regs_10.io_c1_in <= regs_9.io_c1_out @[custum_array.scala 152:24]
    regs_10.io_c2_in <= regs_9.io_c2_out @[custum_array.scala 153:24]
    regs_10.io_c_state <= io_c_state @[custum_array.scala 145:24]
    regs_10.io_d_state <= io_d_state @[custum_array.scala 146:24]
    regs_11.clock <= clock
    regs_11.reset <= reset
    regs_11.io_r_in <= io_r_in_11 @[custum_array.scala 144:21]
    regs_11.io_c1_in <= regs_10.io_c1_out @[custum_array.scala 152:24]
    regs_11.io_c2_in <= regs_10.io_c2_out @[custum_array.scala 153:24]
    regs_11.io_c_state <= io_c_state @[custum_array.scala 145:24]
    regs_11.io_d_state <= io_d_state @[custum_array.scala 146:24]
    regs_12.clock <= clock
    regs_12.reset <= reset
    regs_12.io_r_in <= io_r_in_12 @[custum_array.scala 144:21]
    regs_12.io_c1_in <= regs_11.io_c1_out @[custum_array.scala 152:24]
    regs_12.io_c2_in <= regs_11.io_c2_out @[custum_array.scala 153:24]
    regs_12.io_c_state <= io_c_state @[custum_array.scala 145:24]
    regs_12.io_d_state <= io_d_state @[custum_array.scala 146:24]
    regs_13.clock <= clock
    regs_13.reset <= reset
    regs_13.io_r_in <= io_r_in_13 @[custum_array.scala 144:21]
    regs_13.io_c1_in <= regs_12.io_c1_out @[custum_array.scala 152:24]
    regs_13.io_c2_in <= regs_12.io_c2_out @[custum_array.scala 153:24]
    regs_13.io_c_state <= io_c_state @[custum_array.scala 145:24]
    regs_13.io_d_state <= io_d_state @[custum_array.scala 146:24]
    regs_14.clock <= clock
    regs_14.reset <= reset
    regs_14.io_r_in <= io_r_in_14 @[custum_array.scala 144:21]
    regs_14.io_c1_in <= regs_13.io_c1_out @[custum_array.scala 152:24]
    regs_14.io_c2_in <= regs_13.io_c2_out @[custum_array.scala 153:24]
    regs_14.io_c_state <= io_c_state @[custum_array.scala 145:24]
    regs_14.io_d_state <= io_d_state @[custum_array.scala 146:24]
    regs_15.clock <= clock
    regs_15.reset <= reset
    regs_15.io_r_in <= io_r_in_15 @[custum_array.scala 144:21]
    regs_15.io_c1_in <= regs_14.io_c1_out @[custum_array.scala 152:24]
    regs_15.io_c2_in <= regs_14.io_c2_out @[custum_array.scala 153:24]
    regs_15.io_c_state <= io_c_state @[custum_array.scala 145:24]
    regs_15.io_d_state <= io_d_state @[custum_array.scala 146:24]