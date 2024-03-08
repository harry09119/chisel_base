circuit MAC :
  module MAC :
    input clock : Clock
    input reset : UInt<1>
    input io_c_in_0 : UInt<8>
    input io_c_in_1 : UInt<8>
    input io_c_in_2 : UInt<8>
    input io_c_in_3 : UInt<8>
    input io_c_in_4 : UInt<8>
    input io_c_in_5 : UInt<8>
    input io_c_in_6 : UInt<8>
    input io_c_in_7 : UInt<8>
    input io_c_in_8 : UInt<8>
    input io_c_in_9 : UInt<8>
    input io_c_in_10 : UInt<8>
    input io_c_in_11 : UInt<8>
    input io_c_in_12 : UInt<8>
    input io_c_in_13 : UInt<8>
    input io_c_in_14 : UInt<8>
    input io_c_in_15 : UInt<8>
    input io_r_in : UInt<8>
    input io_o_in : UInt<20>
    output io_o_out : UInt<20>
    input io_bit : UInt<4>
    input io_buffer : UInt<1>
    input io_c_state : UInt<3>
    input io_d_state : UInt<2>
    output io_debug : UInt<32>

    reg o1_reg : UInt<20>, clock with :
      reset => (UInt<1>("h0"), o1_reg) @[custum_array.scala 23:19]
    reg o2_reg : UInt<20>, clock with :
      reset => (UInt<1>("h0"), o2_reg) @[custum_array.scala 24:19]
    node _GEN_0 = mux(io_buffer, o2_reg, o1_reg) @[custum_array.scala 26:19 custum_array.scala 27:14 custum_array.scala 29:14]
    node _T = eq(io_c_state, UInt<3>("h0")) @[custum_array.scala 32:19]
    node _GEN_1 = mux(io_buffer, UInt<1>("h0"), o1_reg) @[custum_array.scala 33:21 custum_array.scala 34:14 custum_array.scala 23:19]
    node _GEN_2 = mux(io_buffer, o2_reg, UInt<1>("h0")) @[custum_array.scala 33:21 custum_array.scala 24:19 custum_array.scala 36:14]
    node _T_1 = eq(io_c_state, UInt<3>("h1")) @[custum_array.scala 38:24]
    node _GEN_3 = validif(eq(UInt<1>("h0"), io_bit), io_c_in_0) @[custum_array.scala 40:42 custum_array.scala 40:42]
    node _GEN_4 = mux(eq(UInt<1>("h1"), io_bit), io_c_in_1, _GEN_3) @[custum_array.scala 40:42 custum_array.scala 40:42]
    node _GEN_5 = mux(eq(UInt<2>("h2"), io_bit), io_c_in_2, _GEN_4) @[custum_array.scala 40:42 custum_array.scala 40:42]
    node _GEN_6 = mux(eq(UInt<2>("h3"), io_bit), io_c_in_3, _GEN_5) @[custum_array.scala 40:42 custum_array.scala 40:42]
    node _GEN_7 = mux(eq(UInt<3>("h4"), io_bit), io_c_in_4, _GEN_6) @[custum_array.scala 40:42 custum_array.scala 40:42]
    node _GEN_8 = mux(eq(UInt<3>("h5"), io_bit), io_c_in_5, _GEN_7) @[custum_array.scala 40:42 custum_array.scala 40:42]
    node _GEN_9 = mux(eq(UInt<3>("h6"), io_bit), io_c_in_6, _GEN_8) @[custum_array.scala 40:42 custum_array.scala 40:42]
    node _GEN_10 = mux(eq(UInt<3>("h7"), io_bit), io_c_in_7, _GEN_9) @[custum_array.scala 40:42 custum_array.scala 40:42]
    node _GEN_11 = mux(eq(UInt<4>("h8"), io_bit), io_c_in_8, _GEN_10) @[custum_array.scala 40:42 custum_array.scala 40:42]
    node _GEN_12 = mux(eq(UInt<4>("h9"), io_bit), io_c_in_9, _GEN_11) @[custum_array.scala 40:42 custum_array.scala 40:42]
    node _GEN_13 = mux(eq(UInt<4>("ha"), io_bit), io_c_in_10, _GEN_12) @[custum_array.scala 40:42 custum_array.scala 40:42]
    node _GEN_14 = mux(eq(UInt<4>("hb"), io_bit), io_c_in_11, _GEN_13) @[custum_array.scala 40:42 custum_array.scala 40:42]
    node _GEN_15 = mux(eq(UInt<4>("hc"), io_bit), io_c_in_12, _GEN_14) @[custum_array.scala 40:42 custum_array.scala 40:42]
    node _GEN_16 = mux(eq(UInt<4>("hd"), io_bit), io_c_in_13, _GEN_15) @[custum_array.scala 40:42 custum_array.scala 40:42]
    node _GEN_17 = mux(eq(UInt<4>("he"), io_bit), io_c_in_14, _GEN_16) @[custum_array.scala 40:42 custum_array.scala 40:42]
    node _GEN_18 = mux(eq(UInt<4>("hf"), io_bit), io_c_in_15, _GEN_17) @[custum_array.scala 40:42 custum_array.scala 40:42]
    node _io_c_in_io_bit = _GEN_18 @[custum_array.scala 40:42]
    node _o1_reg_T = mul(_io_c_in_io_bit, io_r_in) @[custum_array.scala 40:42]
    node _o1_reg_T_1 = add(o1_reg, _o1_reg_T) @[custum_array.scala 40:24]
    node _o1_reg_T_2 = tail(_o1_reg_T_1, 1) @[custum_array.scala 40:24]
    node _io_c_in_io_bit_0 = _GEN_18 @[custum_array.scala 43:42]
    node _o2_reg_T = mul(_io_c_in_io_bit_0, io_r_in) @[custum_array.scala 43:42]
    node _o2_reg_T_1 = add(o2_reg, _o2_reg_T) @[custum_array.scala 43:24]
    node _o2_reg_T_2 = tail(_o2_reg_T_1, 1) @[custum_array.scala 43:24]
    node _GEN_19 = mux(io_buffer, _o1_reg_T_2, io_o_in) @[custum_array.scala 39:21 custum_array.scala 40:14 custum_array.scala 44:14]
    node _GEN_20 = mux(io_buffer, io_o_in, _o2_reg_T_2) @[custum_array.scala 39:21 custum_array.scala 41:14 custum_array.scala 43:14]
    node _T_2 = eq(io_c_state, UInt<3>("h2")) @[custum_array.scala 46:25]
    node _io_c_in_io_bit_1 = _GEN_18 @[custum_array.scala 48:42]
    node _o1_reg_T_3 = mul(_io_c_in_io_bit_1, io_r_in) @[custum_array.scala 48:42]
    node _o1_reg_T_4 = add(o1_reg, _o1_reg_T_3) @[custum_array.scala 48:24]
    node _o1_reg_T_5 = tail(_o1_reg_T_4, 1) @[custum_array.scala 48:24]
    node _io_c_in_io_bit_2 = _GEN_18 @[custum_array.scala 51:42]
    node _o2_reg_T_3 = mul(_io_c_in_io_bit_2, io_r_in) @[custum_array.scala 51:42]
    node _o2_reg_T_4 = add(o2_reg, _o2_reg_T_3) @[custum_array.scala 51:24]
    node _o2_reg_T_5 = tail(_o2_reg_T_4, 1) @[custum_array.scala 51:24]
    node _GEN_21 = mux(io_buffer, _o1_reg_T_5, io_o_in) @[custum_array.scala 47:21 custum_array.scala 48:14 custum_array.scala 52:14]
    node _GEN_22 = mux(io_buffer, io_o_in, _o2_reg_T_5) @[custum_array.scala 47:21 custum_array.scala 49:14 custum_array.scala 51:14]
    node _T_3 = eq(io_c_state, UInt<3>("h4")) @[custum_array.scala 54:25]
    node _GEN_23 = mux(io_buffer, o1_reg, io_o_in) @[custum_array.scala 55:21 custum_array.scala 56:14 custum_array.scala 60:14]
    node _GEN_24 = mux(io_buffer, io_o_in, o2_reg) @[custum_array.scala 55:21 custum_array.scala 57:14 custum_array.scala 59:14]
    node _GEN_25 = mux(_T_3, _GEN_23, o1_reg) @[custum_array.scala 54:39 custum_array.scala 63:12]
    node _GEN_26 = mux(_T_3, _GEN_24, o2_reg) @[custum_array.scala 54:39 custum_array.scala 64:12]
    node _GEN_27 = mux(_T_2, _GEN_21, _GEN_25) @[custum_array.scala 46:39]
    node _GEN_28 = mux(_T_2, _GEN_22, _GEN_26) @[custum_array.scala 46:39]
    node _GEN_29 = mux(_T_1, _GEN_19, _GEN_27) @[custum_array.scala 38:37]
    node _GEN_30 = mux(_T_1, _GEN_20, _GEN_28) @[custum_array.scala 38:37]
    node _GEN_31 = mux(_T, _GEN_1, _GEN_29) @[custum_array.scala 32:33]
    node _GEN_32 = mux(_T, _GEN_2, _GEN_30) @[custum_array.scala 32:33]
    node _T_4 = eq(io_d_state, UInt<2>("h1")) @[custum_array.scala 67:19]
    node _GEN_33 = mux(io_buffer, o1_reg, o2_reg) @[custum_array.scala 68:20 custum_array.scala 69:16 custum_array.scala 71:16]
    node _GEN_34 = mux(_T_4, _GEN_33, UInt<1>("h0")) @[custum_array.scala 67:33 custum_array.scala 74:14]
    io_o_out <= _GEN_0
    io_debug <= _GEN_34
    o1_reg <= _GEN_31
    o2_reg <= _GEN_32