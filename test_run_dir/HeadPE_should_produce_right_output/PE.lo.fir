circuit PE :
  module PE :
    input clock : Clock
    input reset : UInt<1>
    input io_col_in : UInt<8>
    output io_col_out : UInt<8>
    input io_row_in : UInt<8>
    output io_row_out : UInt<8>
    input io_out_in : UInt<20>
    output io_out_out : UInt<20>
    input io_flow_index : UInt<2>
    input io_out_index : UInt<1>
    output io_debug_0 : UInt<20>
    output io_debug_1 : UInt<20>

    reg row_ : UInt<8>, clock with :
      reset => (UInt<1>("h0"), row_) @[my_array.scala 87:17]
    reg col_ : UInt<8>, clock with :
      reset => (UInt<1>("h0"), col_) @[my_array.scala 88:17]
    reg out_0 : UInt<20>, clock with :
      reset => (UInt<1>("h0"), out_0) @[my_array.scala 93:18]
    reg out_1 : UInt<20>, clock with :
      reset => (UInt<1>("h0"), out_1) @[my_array.scala 94:18]
    node _T = eq(io_out_index, UInt<1>("h1")) @[my_array.scala 96:21]
    node _GEN_0 = mux(_T, out_0, out_1) @[my_array.scala 96:30 my_array.scala 97:16 my_array.scala 99:16]
    node _T_1 = eq(io_flow_index, UInt<1>("h0")) @[my_array.scala 104:22]
    node _T_2 = eq(io_flow_index, UInt<1>("h1")) @[my_array.scala 109:28]
    node _T_3 = eq(io_out_index, UInt<1>("h0")) @[my_array.scala 113:23]
    node _out_0_T = mul(io_col_in, io_row_in) @[my_array.scala 114:26]
    node _out_0_T_1 = add(_out_0_T, out_0) @[my_array.scala 114:38]
    node _out_0_T_2 = tail(_out_0_T_1, 1) @[my_array.scala 114:38]
    node _out_1_T = mul(io_col_in, io_row_in) @[my_array.scala 117:26]
    node _out_1_T_1 = add(_out_1_T, out_1) @[my_array.scala 117:38]
    node _out_1_T_2 = tail(_out_1_T_1, 1) @[my_array.scala 117:38]
    node _GEN_1 = mux(_T_3, _out_0_T_2, io_out_in) @[my_array.scala 113:32 my_array.scala 114:13 my_array.scala 118:13]
    node _GEN_2 = mux(_T_3, io_out_in, _out_1_T_2) @[my_array.scala 113:32 my_array.scala 115:13 my_array.scala 117:13]
    node _T_4 = eq(io_flow_index, UInt<2>("h2")) @[my_array.scala 120:28]
    node _T_5 = eq(io_out_index, UInt<1>("h0")) @[my_array.scala 124:23]
    node _out_0_T_3 = mul(io_col_in, io_row_in) @[my_array.scala 125:26]
    node _out_0_T_4 = add(_out_0_T_3, out_0) @[my_array.scala 125:38]
    node _out_0_T_5 = tail(_out_0_T_4, 1) @[my_array.scala 125:38]
    node _out_1_T_3 = mul(io_col_in, io_row_in) @[my_array.scala 128:26]
    node _out_1_T_4 = add(_out_1_T_3, out_1) @[my_array.scala 128:38]
    node _out_1_T_5 = tail(_out_1_T_4, 1) @[my_array.scala 128:38]
    node _GEN_3 = mux(_T_5, _out_0_T_5, out_0) @[my_array.scala 124:32 my_array.scala 125:13 my_array.scala 129:13]
    node _GEN_4 = mux(_T_5, out_1, _out_1_T_5) @[my_array.scala 124:32 my_array.scala 126:13 my_array.scala 128:13]
    node _GEN_5 = mux(_T_4, io_row_in, row_) @[my_array.scala 120:37 my_array.scala 121:10 my_array.scala 87:17]
    node _GEN_6 = mux(_T_4, io_col_in, col_) @[my_array.scala 120:37 my_array.scala 122:10 my_array.scala 88:17]
    node _GEN_7 = mux(_T_4, _GEN_3, out_0) @[my_array.scala 120:37 my_array.scala 93:18]
    node _GEN_8 = mux(_T_4, _GEN_4, out_1) @[my_array.scala 120:37 my_array.scala 94:18]
    node _GEN_9 = mux(_T_2, io_row_in, _GEN_5) @[my_array.scala 109:37 my_array.scala 110:10]
    node _GEN_10 = mux(_T_2, io_col_in, _GEN_6) @[my_array.scala 109:37 my_array.scala 111:10]
    node _GEN_11 = mux(_T_2, _GEN_1, _GEN_7) @[my_array.scala 109:37]
    node _GEN_12 = mux(_T_2, _GEN_2, _GEN_8) @[my_array.scala 109:37]
    node _GEN_13 = mux(_T_1, UInt<1>("h0"), _GEN_9) @[my_array.scala 104:31 my_array.scala 105:11]
    node _GEN_14 = mux(_T_1, UInt<1>("h0"), _GEN_10) @[my_array.scala 104:31 my_array.scala 106:11]
    node _GEN_15 = mux(_T_1, UInt<1>("h0"), _GEN_11) @[my_array.scala 104:31 my_array.scala 107:11]
    node _GEN_16 = mux(_T_1, UInt<1>("h0"), _GEN_12) @[my_array.scala 104:31 my_array.scala 108:11]
    io_col_out <= col_ @[my_array.scala 91:14]
    io_row_out <= row_ @[my_array.scala 90:14]
    io_out_out <= _GEN_0
    io_debug_0 <= out_0 @[my_array.scala 101:15]
    io_debug_1 <= out_1 @[my_array.scala 102:15]
    row_ <= _GEN_13
    col_ <= _GEN_14
    out_0 <= _GEN_15
    out_1 <= _GEN_16