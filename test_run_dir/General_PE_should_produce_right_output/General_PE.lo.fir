circuit General_PE :
  module General_PE :
    input clock : Clock
    input reset : UInt<1>
    input io_col_in : UInt<8>
    output io_col_out : UInt<8>
    input io_row_in : UInt<8>
    output io_row_out : UInt<8>
    input io_out_in : UInt<20>
    output io_out_out : UInt<20>
    input io_flow_ctrl : UInt<2>
    input io_out_ctrl : UInt<1>
    output io_debug_0 : UInt<20>
    output io_debug_1 : UInt<20>

    reg row : UInt<8>, clock with :
      reset => (UInt<1>("h0"), row) @[sadves.scala 22:16]
    reg col : UInt<8>, clock with :
      reset => (UInt<1>("h0"), col) @[sadves.scala 23:16]
    reg out0 : UInt<20>, clock with :
      reset => (UInt<1>("h0"), out0) @[sadves.scala 28:17]
    reg out1 : UInt<20>, clock with :
      reset => (UInt<1>("h0"), out1) @[sadves.scala 29:17]
    node _T = eq(io_out_ctrl, UInt<1>("h1")) @[sadves.scala 34:15]
    node _GEN_0 = mux(_T, out0, out1) @[sadves.scala 34:24 sadves.scala 35:16 sadves.scala 37:16]
    node _T_1 = eq(io_flow_ctrl, UInt<1>("h0")) @[sadves.scala 44:15]
    node _T_2 = eq(io_flow_ctrl, UInt<1>("h1")) @[sadves.scala 49:21]
    node _T_3 = eq(io_out_ctrl, UInt<1>("h0")) @[sadves.scala 53:17]
    node _out0_T = mul(io_col_in, io_row_in) @[sadves.scala 54:25]
    node _out0_T_1 = add(_out0_T, out0) @[sadves.scala 54:37]
    node _out0_T_2 = tail(_out0_T_1, 1) @[sadves.scala 54:37]
    node _out1_T = mul(io_col_in, io_row_in) @[sadves.scala 57:25]
    node _out1_T_1 = add(_out1_T, out1) @[sadves.scala 57:37]
    node _out1_T_2 = tail(_out1_T_1, 1) @[sadves.scala 57:37]
    node _GEN_1 = mux(_T_3, _out0_T_2, io_out_in) @[sadves.scala 53:26 sadves.scala 54:12 sadves.scala 58:12]
    node _GEN_2 = mux(_T_3, io_out_in, _out1_T_2) @[sadves.scala 53:26 sadves.scala 55:12 sadves.scala 57:12]
    node _T_4 = eq(io_flow_ctrl, UInt<2>("h2")) @[sadves.scala 60:21]
    node _T_5 = eq(io_out_ctrl, UInt<1>("h0")) @[sadves.scala 64:17]
    node _out0_T_3 = mul(io_col_in, io_row_in) @[sadves.scala 65:25]
    node _out0_T_4 = add(_out0_T_3, out0) @[sadves.scala 65:37]
    node _out0_T_5 = tail(_out0_T_4, 1) @[sadves.scala 65:37]
    node _out1_T_3 = mul(io_col_in, io_row_in) @[sadves.scala 68:25]
    node _out1_T_4 = add(_out1_T_3, out1) @[sadves.scala 68:37]
    node _out1_T_5 = tail(_out1_T_4, 1) @[sadves.scala 68:37]
    node _GEN_3 = mux(_T_5, _out0_T_5, out0) @[sadves.scala 64:26 sadves.scala 65:12 sadves.scala 69:12]
    node _GEN_4 = mux(_T_5, out1, _out1_T_5) @[sadves.scala 64:26 sadves.scala 66:12 sadves.scala 68:12]
    node _GEN_5 = mux(_T_4, io_row_in, row) @[sadves.scala 60:30 sadves.scala 61:9 sadves.scala 22:16]
    node _GEN_6 = mux(_T_4, io_col_in, col) @[sadves.scala 60:30 sadves.scala 62:9 sadves.scala 23:16]
    node _GEN_7 = mux(_T_4, _GEN_3, out0) @[sadves.scala 60:30 sadves.scala 28:17]
    node _GEN_8 = mux(_T_4, _GEN_4, out1) @[sadves.scala 60:30 sadves.scala 29:17]
    node _GEN_9 = mux(_T_2, io_row_in, _GEN_5) @[sadves.scala 49:30 sadves.scala 50:9]
    node _GEN_10 = mux(_T_2, io_col_in, _GEN_6) @[sadves.scala 49:30 sadves.scala 51:9]
    node _GEN_11 = mux(_T_2, _GEN_1, _GEN_7) @[sadves.scala 49:30]
    node _GEN_12 = mux(_T_2, _GEN_2, _GEN_8) @[sadves.scala 49:30]
    node _GEN_13 = mux(_T_1, UInt<1>("h0"), _GEN_9) @[sadves.scala 44:24 sadves.scala 45:10]
    node _GEN_14 = mux(_T_1, UInt<1>("h0"), _GEN_10) @[sadves.scala 44:24 sadves.scala 46:10]
    node _GEN_15 = mux(_T_1, UInt<1>("h0"), _GEN_11) @[sadves.scala 44:24 sadves.scala 47:10]
    node _GEN_16 = mux(_T_1, UInt<1>("h0"), _GEN_12) @[sadves.scala 44:24 sadves.scala 48:10]
    io_col_out <= col @[sadves.scala 26:14]
    io_row_out <= row @[sadves.scala 25:14]
    io_out_out <= _GEN_0
    io_debug_0 <= out0 @[sadves.scala 73:15]
    io_debug_1 <= out1 @[sadves.scala 74:15]
    row <= _GEN_13
    col <= _GEN_14
    out0 <= _GEN_15
    out1 <= _GEN_16