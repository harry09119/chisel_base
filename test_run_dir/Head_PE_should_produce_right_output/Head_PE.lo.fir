circuit Head_PE :
  module Head_PE :
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
    input io_flow_ctrl : UInt<2>
    input io_out_ctrl : UInt<1>
    input io_col_ctrl : UInt<2>
    output io_debug_0 : UInt<20>
    output io_debug_1 : UInt<20>

    reg row : UInt<8>, clock with :
      reset => (UInt<1>("h0"), row) @[sadves.scala 95:16]
    reg col : UInt<8>, clock with :
      reset => (UInt<1>("h0"), col) @[sadves.scala 96:16]
    reg out0 : UInt<20>, clock with :
      reset => (UInt<1>("h0"), out0) @[sadves.scala 101:17]
    reg out1 : UInt<20>, clock with :
      reset => (UInt<1>("h0"), out1) @[sadves.scala 102:17]
    node _T = eq(io_out_ctrl, UInt<1>("h1")) @[sadves.scala 108:15]
    node _GEN_0 = mux(_T, out0, out1) @[sadves.scala 108:24 sadves.scala 109:16 sadves.scala 111:16]
    node _T_1 = eq(io_flow_ctrl, UInt<1>("h0")) @[sadves.scala 118:15]
    node _T_2 = eq(io_flow_ctrl, UInt<1>("h1")) @[sadves.scala 123:21]
    node _GEN_1 = validif(eq(UInt<1>("h0"), io_col_ctrl), io_col_in_0) @[sadves.scala 125:9 sadves.scala 125:9]
    node _GEN_2 = mux(eq(UInt<1>("h1"), io_col_ctrl), io_col_in_1, _GEN_1) @[sadves.scala 125:9 sadves.scala 125:9]
    node _GEN_3 = mux(eq(UInt<2>("h2"), io_col_ctrl), io_col_in_2, _GEN_2) @[sadves.scala 125:9 sadves.scala 125:9]
    node _GEN_4 = mux(eq(UInt<2>("h3"), io_col_ctrl), io_col_in_3, _GEN_3) @[sadves.scala 125:9 sadves.scala 125:9]
    node _T_3 = eq(io_out_ctrl, UInt<1>("h0")) @[sadves.scala 127:17]
    node _io_col_in_io_col_ctrl_0 = _GEN_4 @[sadves.scala 128:33]
    node _out0_T = mul(_io_col_in_io_col_ctrl_0, io_row_in) @[sadves.scala 128:33]
    node _out0_T_1 = add(_out0_T, out0) @[sadves.scala 128:45]
    node _out0_T_2 = tail(_out0_T_1, 1) @[sadves.scala 128:45]
    node _io_col_in_io_col_ctrl_1 = _GEN_4 @[sadves.scala 131:33]
    node _out1_T = mul(_io_col_in_io_col_ctrl_1, io_row_in) @[sadves.scala 131:33]
    node _out1_T_1 = add(_out1_T, out1) @[sadves.scala 131:45]
    node _out1_T_2 = tail(_out1_T_1, 1) @[sadves.scala 131:45]
    node _GEN_5 = mux(_T_3, _out0_T_2, io_out_in) @[sadves.scala 127:26 sadves.scala 128:12 sadves.scala 132:12]
    node _GEN_6 = mux(_T_3, io_out_in, _out1_T_2) @[sadves.scala 127:26 sadves.scala 129:12 sadves.scala 131:12]
    node _T_4 = eq(io_flow_ctrl, UInt<2>("h2")) @[sadves.scala 134:21]
    node _T_5 = eq(io_out_ctrl, UInt<1>("h0")) @[sadves.scala 138:17]
    node _io_col_in_io_col_ctrl_3 = _GEN_4 @[sadves.scala 139:33]
    node _out0_T_3 = mul(_io_col_in_io_col_ctrl_3, io_row_in) @[sadves.scala 139:33]
    node _out0_T_4 = add(_out0_T_3, out0) @[sadves.scala 139:45]
    node _out0_T_5 = tail(_out0_T_4, 1) @[sadves.scala 139:45]
    node _io_col_in_io_col_ctrl_4 = _GEN_4 @[sadves.scala 142:33]
    node _out1_T_3 = mul(_io_col_in_io_col_ctrl_4, io_row_in) @[sadves.scala 142:33]
    node _out1_T_4 = add(_out1_T_3, out1) @[sadves.scala 142:45]
    node _out1_T_5 = tail(_out1_T_4, 1) @[sadves.scala 142:45]
    node _GEN_7 = mux(_T_5, _out0_T_5, out0) @[sadves.scala 138:26 sadves.scala 139:12 sadves.scala 143:12]
    node _GEN_8 = mux(_T_5, out1, _out1_T_5) @[sadves.scala 138:26 sadves.scala 140:12 sadves.scala 142:12]
    node _GEN_9 = mux(_T_4, io_row_in, row) @[sadves.scala 134:30 sadves.scala 135:9 sadves.scala 95:16]
    node _io_col_in_io_col_ctrl_2 = _GEN_4 @[sadves.scala 136:9]
    node _GEN_10 = mux(_T_4, _io_col_in_io_col_ctrl_2, col) @[sadves.scala 134:30 sadves.scala 136:9 sadves.scala 96:16]
    node _GEN_11 = mux(_T_4, _GEN_7, out0) @[sadves.scala 134:30 sadves.scala 101:17]
    node _GEN_12 = mux(_T_4, _GEN_8, out1) @[sadves.scala 134:30 sadves.scala 102:17]
    node _GEN_13 = mux(_T_2, io_row_in, _GEN_9) @[sadves.scala 123:30 sadves.scala 124:9]
    node _io_col_in_io_col_ctrl = _GEN_4 @[sadves.scala 125:9]
    node _GEN_14 = mux(_T_2, _io_col_in_io_col_ctrl, _GEN_10) @[sadves.scala 123:30 sadves.scala 125:9]
    node _GEN_15 = mux(_T_2, _GEN_5, _GEN_11) @[sadves.scala 123:30]
    node _GEN_16 = mux(_T_2, _GEN_6, _GEN_12) @[sadves.scala 123:30]
    node _GEN_17 = mux(_T_1, UInt<1>("h0"), _GEN_13) @[sadves.scala 118:24 sadves.scala 119:10]
    node _GEN_18 = mux(_T_1, UInt<1>("h0"), _GEN_14) @[sadves.scala 118:24 sadves.scala 120:10]
    node _GEN_19 = mux(_T_1, UInt<1>("h0"), _GEN_15) @[sadves.scala 118:24 sadves.scala 121:10]
    node _GEN_20 = mux(_T_1, UInt<1>("h0"), _GEN_16) @[sadves.scala 118:24 sadves.scala 122:10]
    io_col_out <= col @[sadves.scala 99:14]
    io_row_out <= row @[sadves.scala 98:14]
    io_out_out <= _GEN_0
    io_debug_0 <= out0 @[sadves.scala 147:15]
    io_debug_1 <= out1 @[sadves.scala 148:15]
    row <= _GEN_17
    col <= _GEN_18
    out0 <= _GEN_19
    out1 <= _GEN_20