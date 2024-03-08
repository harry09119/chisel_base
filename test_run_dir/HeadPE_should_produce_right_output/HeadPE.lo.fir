circuit HeadPE :
  module HeadPE :
    input clock : Clock
    input reset : UInt<1>
    input io_col_in_0 : UInt<8>
    input io_col_in_1 : UInt<8>
    input io_col_in_2 : UInt<8>
    input io_col_in_3 : UInt<8>
    output io_col_out : UInt<8>
    input io_row_in : UInt<8>
    output io_row_out : UInt<8>
    input io_out_in : UInt<20>
    output io_out_out : UInt<20>
    input io_flow_index : UInt<2>
    input io_window_index : UInt<2>
    input io_out_index : UInt<1>
    output io_debug_0 : UInt<20>
    output io_debug_1 : UInt<20>

    reg row_ : UInt<8>, clock with :
      reset => (UInt<1>("h0"), row_) @[my_array.scala 24:17]
    reg col_ : UInt<8>, clock with :
      reset => (UInt<1>("h0"), col_) @[my_array.scala 25:17]
    reg out_0 : UInt<20>, clock with :
      reset => (UInt<1>("h0"), out_0) @[my_array.scala 30:18]
    reg out_1 : UInt<20>, clock with :
      reset => (UInt<1>("h0"), out_1) @[my_array.scala 31:18]
    node _T = eq(io_out_index, UInt<1>("h0")) @[my_array.scala 33:21]
    node _GEN_0 = mux(_T, out_0, out_1) @[my_array.scala 33:30 my_array.scala 34:16 my_array.scala 36:16]
    node _T_1 = eq(io_flow_index, UInt<1>("h0")) @[my_array.scala 41:22]
    node _T_2 = eq(io_flow_index, UInt<1>("h1")) @[my_array.scala 46:28]
    node _GEN_1 = validif(eq(UInt<1>("h0"), io_window_index), io_col_in_0) @[my_array.scala 48:10 my_array.scala 48:10]
    node _GEN_2 = mux(eq(UInt<1>("h1"), io_window_index), io_col_in_1, _GEN_1) @[my_array.scala 48:10 my_array.scala 48:10]
    node _GEN_3 = mux(eq(UInt<2>("h2"), io_window_index), io_col_in_2, _GEN_2) @[my_array.scala 48:10 my_array.scala 48:10]
    node _GEN_4 = mux(eq(UInt<2>("h3"), io_window_index), io_col_in_3, _GEN_3) @[my_array.scala 48:10 my_array.scala 48:10]
    node _T_3 = eq(io_out_index, UInt<1>("h0")) @[my_array.scala 50:23]
    node _io_col_in_io_window_index_0 = _GEN_4 @[my_array.scala 51:43]
    node _out_0_T = mul(_io_col_in_io_window_index_0, io_row_in) @[my_array.scala 51:43]
    node _out_0_T_1 = add(_out_0_T, out_0) @[my_array.scala 51:55]
    node _out_0_T_2 = tail(_out_0_T_1, 1) @[my_array.scala 51:55]
    node _io_col_in_io_window_index_1 = _GEN_4 @[my_array.scala 54:43]
    node _out_1_T = mul(_io_col_in_io_window_index_1, io_row_in) @[my_array.scala 54:43]
    node _out_1_T_1 = add(_out_1_T, out_1) @[my_array.scala 54:55]
    node _out_1_T_2 = tail(_out_1_T_1, 1) @[my_array.scala 54:55]
    node _GEN_5 = mux(_T_3, _out_0_T_2, io_out_in) @[my_array.scala 50:32 my_array.scala 51:13 my_array.scala 55:13]
    node _GEN_6 = mux(_T_3, io_out_in, _out_1_T_2) @[my_array.scala 50:32 my_array.scala 52:13 my_array.scala 54:13]
    node _T_4 = eq(io_flow_index, UInt<2>("h2")) @[my_array.scala 58:28]
    node _T_5 = eq(io_out_index, UInt<1>("h0")) @[my_array.scala 62:23]
    node _io_col_in_io_window_index_3 = _GEN_4 @[my_array.scala 63:43]
    node _out_0_T_3 = mul(_io_col_in_io_window_index_3, io_row_in) @[my_array.scala 63:43]
    node _out_0_T_4 = add(_out_0_T_3, out_0) @[my_array.scala 63:55]
    node _out_0_T_5 = tail(_out_0_T_4, 1) @[my_array.scala 63:55]
    node _io_col_in_io_window_index_4 = _GEN_4 @[my_array.scala 66:43]
    node _out_1_T_3 = mul(_io_col_in_io_window_index_4, io_row_in) @[my_array.scala 66:43]
    node _out_1_T_4 = add(_out_1_T_3, out_1) @[my_array.scala 66:55]
    node _out_1_T_5 = tail(_out_1_T_4, 1) @[my_array.scala 66:55]
    node _GEN_7 = mux(_T_5, _out_0_T_5, out_0) @[my_array.scala 62:32 my_array.scala 63:13 my_array.scala 67:13]
    node _GEN_8 = mux(_T_5, out_1, _out_1_T_5) @[my_array.scala 62:32 my_array.scala 64:13 my_array.scala 66:13]
    node _GEN_9 = mux(_T_4, io_row_in, row_) @[my_array.scala 58:37 my_array.scala 59:10 my_array.scala 24:17]
    node _io_col_in_io_window_index_2 = _GEN_4 @[my_array.scala 60:10]
    node _GEN_10 = mux(_T_4, _io_col_in_io_window_index_2, col_) @[my_array.scala 58:37 my_array.scala 60:10 my_array.scala 25:17]
    node _GEN_11 = mux(_T_4, _GEN_7, out_0) @[my_array.scala 58:37 my_array.scala 30:18]
    node _GEN_12 = mux(_T_4, _GEN_8, out_1) @[my_array.scala 58:37 my_array.scala 31:18]
    node _GEN_13 = mux(_T_2, io_row_in, _GEN_9) @[my_array.scala 46:37 my_array.scala 47:10]
    node _io_col_in_io_window_index = _GEN_4 @[my_array.scala 48:10]
    node _GEN_14 = mux(_T_2, _io_col_in_io_window_index, _GEN_10) @[my_array.scala 46:37 my_array.scala 48:10]
    node _GEN_15 = mux(_T_2, _GEN_5, _GEN_11) @[my_array.scala 46:37]
    node _GEN_16 = mux(_T_2, _GEN_6, _GEN_12) @[my_array.scala 46:37]
    node _GEN_17 = mux(_T_1, UInt<1>("h0"), _GEN_13) @[my_array.scala 41:31 my_array.scala 42:11]
    node _GEN_18 = mux(_T_1, UInt<1>("h0"), _GEN_14) @[my_array.scala 41:31 my_array.scala 43:11]
    node _GEN_19 = mux(_T_1, UInt<1>("h0"), _GEN_15) @[my_array.scala 41:31 my_array.scala 44:11]
    node _GEN_20 = mux(_T_1, UInt<1>("h0"), _GEN_16) @[my_array.scala 41:31 my_array.scala 45:11]
    io_col_out <= col_ @[my_array.scala 28:14]
    io_row_out <= row_ @[my_array.scala 27:14]
    io_out_out <= _GEN_0
    io_debug_0 <= out_0 @[my_array.scala 38:15]
    io_debug_1 <= out_1 @[my_array.scala 39:15]
    row_ <= _GEN_17
    col_ <= _GEN_18
    out_0 <= _GEN_19
    out_1 <= _GEN_20