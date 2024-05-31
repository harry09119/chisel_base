circuit Column_PE :
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

  module Group_PE :
    input clock : Clock
    input reset : UInt<1>
    input io_col_in_0 : UInt<8>
    input io_col_in_1 : UInt<8>
    input io_col_in_2 : UInt<8>
    input io_col_in_3 : UInt<8>
    output io_col_out : UInt<8>
    input io_row_in_0 : UInt<8>
    input io_row_in_1 : UInt<8>
    output io_row_out_0 : UInt<8>
    output io_row_out_1 : UInt<8>
    input io_out_in : UInt<20>
    output io_out_out : UInt<20>
    input io_flow_ctrl : UInt<2>
    input io_out_ctrl : UInt<1>
    input io_col_ctrl : UInt<2>
    output io_debug_0_0 : UInt<20>
    output io_debug_0_1 : UInt<20>
    output io_debug_1_0 : UInt<20>
    output io_debug_1_1 : UInt<20>

    inst Head of Head_PE @[sadves.scala 169:20]
    inst Generals_0 of General_PE @[sadves.scala 170:58]
    reg o_ctrls_0 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), o_ctrls_0) @[sadves.scala 181:24]
    reg o_ctrls_1 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), o_ctrls_1) @[sadves.scala 181:24]
    node _o_ctrls_WIRE_0 = UInt<1>("h0") @[sadves.scala 181:32 sadves.scala 181:32]
    node _o_ctrls_WIRE_1 = UInt<1>("h0") @[sadves.scala 181:32 sadves.scala 181:32]
    io_col_out <= Generals_0.io_col_out @[sadves.scala 171:14]
    io_row_out_0 <= Head.io_row_out @[sadves.scala 172:17]
    io_row_out_1 <= Generals_0.io_row_out @[sadves.scala 174:19]
    io_out_out <= Head.io_out_out @[sadves.scala 202:14]
    io_debug_0_0 <= Head.io_debug_0 @[sadves.scala 209:18]
    io_debug_0_1 <= Head.io_debug_1 @[sadves.scala 210:18]
    io_debug_1_0 <= Generals_0.io_debug_0 @[sadves.scala 212:20]
    io_debug_1_1 <= Generals_0.io_debug_1 @[sadves.scala 213:20]
    Head.clock <= clock
    Head.reset <= reset
    Head.io_col_in_0 <= io_col_in_0 @[sadves.scala 197:18]
    Head.io_col_in_1 <= io_col_in_1 @[sadves.scala 197:18]
    Head.io_col_in_2 <= io_col_in_2 @[sadves.scala 197:18]
    Head.io_col_in_3 <= io_col_in_3 @[sadves.scala 197:18]
    Head.io_row_in <= io_row_in_0 @[sadves.scala 192:18]
    Head.io_out_in <= Generals_0.io_out_out @[sadves.scala 203:18]
    Head.io_flow_ctrl <= io_flow_ctrl @[sadves.scala 177:21]
    Head.io_out_ctrl <= io_out_ctrl @[sadves.scala 183:20]
    Head.io_col_ctrl <= io_col_ctrl @[sadves.scala 189:20]
    Generals_0.clock <= clock
    Generals_0.reset <= reset
    Generals_0.io_col_in <= Head.io_col_out @[sadves.scala 198:25]
    Generals_0.io_row_in <= io_row_in_1 @[sadves.scala 194:29]
    Generals_0.io_out_in <= io_out_in @[sadves.scala 206:29]
    Generals_0.io_flow_ctrl <= io_flow_ctrl @[sadves.scala 179:30]
    Generals_0.io_out_ctrl <= o_ctrls_0 @[sadves.scala 186:31]
    o_ctrls_0 <= mux(reset, _o_ctrls_WIRE_0, io_out_ctrl) @[sadves.scala 181:24 sadves.scala 181:24 sadves.scala 182:14]
    o_ctrls_1 <= mux(reset, _o_ctrls_WIRE_1, o_ctrls_0) @[sadves.scala 181:24 sadves.scala 181:24 sadves.scala 185:16]

  module Column_PE :
    input clock : Clock
    input reset : UInt<1>
    input io_col_in_0 : UInt<8>
    input io_col_in_1 : UInt<8>
    input io_col_in_2 : UInt<8>
    input io_col_in_3 : UInt<8>
    output io_col_out : UInt<8>
    input io_row_in_0_0 : UInt<8>
    input io_row_in_0_1 : UInt<8>
    input io_row_in_1_0 : UInt<8>
    input io_row_in_1_1 : UInt<8>
    input io_row_in_2_0 : UInt<8>
    input io_row_in_2_1 : UInt<8>
    input io_row_in_3_0 : UInt<8>
    input io_row_in_3_1 : UInt<8>
    output io_row_out_0_0 : UInt<8>
    output io_row_out_0_1 : UInt<8>
    output io_row_out_1_0 : UInt<8>
    output io_row_out_1_1 : UInt<8>
    output io_row_out_2_0 : UInt<8>
    output io_row_out_2_1 : UInt<8>
    output io_row_out_3_0 : UInt<8>
    output io_row_out_3_1 : UInt<8>
    input io_out_in : UInt<20>
    output io_out_out : UInt<20>
    input io_flow_ctrl : UInt<2>
    input io_out_ctrl_0 : UInt<1>
    input io_out_ctrl_1 : UInt<1>
    input io_out_ctrl_2 : UInt<1>
    input io_out_ctrl_3 : UInt<1>
    input io_col_ctrl_0 : UInt<2>
    input io_col_ctrl_1 : UInt<2>
    input io_col_ctrl_2 : UInt<2>
    input io_col_ctrl_3 : UInt<2>
    output io_debug_0_0_0 : UInt<20>
    output io_debug_0_0_1 : UInt<20>
    output io_debug_0_1_0 : UInt<20>
    output io_debug_0_1_1 : UInt<20>
    output io_debug_1_0_0 : UInt<20>
    output io_debug_1_0_1 : UInt<20>
    output io_debug_1_1_0 : UInt<20>
    output io_debug_1_1_1 : UInt<20>
    output io_debug_2_0_0 : UInt<20>
    output io_debug_2_0_1 : UInt<20>
    output io_debug_2_1_0 : UInt<20>
    output io_debug_2_1_1 : UInt<20>
    output io_debug_3_0_0 : UInt<20>
    output io_debug_3_0_1 : UInt<20>
    output io_debug_3_1_0 : UInt<20>
    output io_debug_3_1_1 : UInt<20>

    inst Groups_0 of Group_PE @[sadves.scala 235:52]
    inst Groups_1 of Group_PE @[sadves.scala 235:52]
    inst Groups_2 of Group_PE @[sadves.scala 235:52]
    inst Groups_3 of Group_PE @[sadves.scala 235:52]
    io_col_out <= Groups_3.io_col_out @[sadves.scala 240:14]
    io_row_out_0_0 <= Groups_0.io_row_out_0 @[sadves.scala 243:19]
    io_row_out_0_1 <= Groups_0.io_row_out_1 @[sadves.scala 243:19]
    io_row_out_1_0 <= Groups_1.io_row_out_0 @[sadves.scala 243:19]
    io_row_out_1_1 <= Groups_1.io_row_out_1 @[sadves.scala 243:19]
    io_row_out_2_0 <= Groups_2.io_row_out_0 @[sadves.scala 243:19]
    io_row_out_2_1 <= Groups_2.io_row_out_1 @[sadves.scala 243:19]
    io_row_out_3_0 <= Groups_3.io_row_out_0 @[sadves.scala 243:19]
    io_row_out_3_1 <= Groups_3.io_row_out_1 @[sadves.scala 243:19]
    io_out_out <= Groups_0.io_out_out @[sadves.scala 237:14]
    io_debug_0_0_0 <= Groups_0.io_debug_0_0 @[sadves.scala 257:17]
    io_debug_0_0_1 <= Groups_0.io_debug_0_1 @[sadves.scala 257:17]
    io_debug_0_1_0 <= Groups_0.io_debug_1_0 @[sadves.scala 257:17]
    io_debug_0_1_1 <= Groups_0.io_debug_1_1 @[sadves.scala 257:17]
    io_debug_1_0_0 <= Groups_1.io_debug_0_0 @[sadves.scala 257:17]
    io_debug_1_0_1 <= Groups_1.io_debug_0_1 @[sadves.scala 257:17]
    io_debug_1_1_0 <= Groups_1.io_debug_1_0 @[sadves.scala 257:17]
    io_debug_1_1_1 <= Groups_1.io_debug_1_1 @[sadves.scala 257:17]
    io_debug_2_0_0 <= Groups_2.io_debug_0_0 @[sadves.scala 257:17]
    io_debug_2_0_1 <= Groups_2.io_debug_0_1 @[sadves.scala 257:17]
    io_debug_2_1_0 <= Groups_2.io_debug_1_0 @[sadves.scala 257:17]
    io_debug_2_1_1 <= Groups_2.io_debug_1_1 @[sadves.scala 257:17]
    io_debug_3_0_0 <= Groups_3.io_debug_0_0 @[sadves.scala 257:17]
    io_debug_3_0_1 <= Groups_3.io_debug_0_1 @[sadves.scala 257:17]
    io_debug_3_1_0 <= Groups_3.io_debug_1_0 @[sadves.scala 257:17]
    io_debug_3_1_1 <= Groups_3.io_debug_1_1 @[sadves.scala 257:17]
    Groups_0.clock <= clock
    Groups_0.reset <= reset
    Groups_0.io_col_in_0 <= io_col_in_0 @[sadves.scala 245:25]
    Groups_0.io_col_in_1 <= io_col_in_1 @[sadves.scala 245:25]
    Groups_0.io_col_in_2 <= io_col_in_2 @[sadves.scala 245:25]
    Groups_0.io_col_in_3 <= io_col_in_3 @[sadves.scala 245:25]
    Groups_0.io_row_in_0 <= io_row_in_0_0 @[sadves.scala 246:25]
    Groups_0.io_row_in_1 <= io_row_in_0_1 @[sadves.scala 246:25]
    Groups_0.io_out_in <= Groups_1.io_out_out @[sadves.scala 252:27]
    Groups_0.io_flow_ctrl <= io_flow_ctrl @[sadves.scala 247:28]
    Groups_0.io_out_ctrl <= io_out_ctrl_0 @[sadves.scala 248:27]
    Groups_0.io_col_ctrl <= io_col_ctrl_0 @[sadves.scala 249:27]
    Groups_1.clock <= clock
    Groups_1.reset <= reset
    Groups_1.io_col_in_0 <= io_col_in_0 @[sadves.scala 245:25]
    Groups_1.io_col_in_1 <= io_col_in_1 @[sadves.scala 245:25]
    Groups_1.io_col_in_2 <= io_col_in_2 @[sadves.scala 245:25]
    Groups_1.io_col_in_3 <= io_col_in_3 @[sadves.scala 245:25]
    Groups_1.io_row_in_0 <= io_row_in_1_0 @[sadves.scala 246:25]
    Groups_1.io_row_in_1 <= io_row_in_1_1 @[sadves.scala 246:25]
    Groups_1.io_out_in <= Groups_2.io_out_out @[sadves.scala 252:27]
    Groups_1.io_flow_ctrl <= io_flow_ctrl @[sadves.scala 247:28]
    Groups_1.io_out_ctrl <= io_out_ctrl_1 @[sadves.scala 248:27]
    Groups_1.io_col_ctrl <= io_col_ctrl_1 @[sadves.scala 249:27]
    Groups_2.clock <= clock
    Groups_2.reset <= reset
    Groups_2.io_col_in_0 <= io_col_in_0 @[sadves.scala 245:25]
    Groups_2.io_col_in_1 <= io_col_in_1 @[sadves.scala 245:25]
    Groups_2.io_col_in_2 <= io_col_in_2 @[sadves.scala 245:25]
    Groups_2.io_col_in_3 <= io_col_in_3 @[sadves.scala 245:25]
    Groups_2.io_row_in_0 <= io_row_in_2_0 @[sadves.scala 246:25]
    Groups_2.io_row_in_1 <= io_row_in_2_1 @[sadves.scala 246:25]
    Groups_2.io_out_in <= Groups_3.io_out_out @[sadves.scala 252:27]
    Groups_2.io_flow_ctrl <= io_flow_ctrl @[sadves.scala 247:28]
    Groups_2.io_out_ctrl <= io_out_ctrl_2 @[sadves.scala 248:27]
    Groups_2.io_col_ctrl <= io_col_ctrl_2 @[sadves.scala 249:27]
    Groups_3.clock <= clock
    Groups_3.reset <= reset
    Groups_3.io_col_in_0 <= io_col_in_0 @[sadves.scala 245:25]
    Groups_3.io_col_in_1 <= io_col_in_1 @[sadves.scala 245:25]
    Groups_3.io_col_in_2 <= io_col_in_2 @[sadves.scala 245:25]
    Groups_3.io_col_in_3 <= io_col_in_3 @[sadves.scala 245:25]
    Groups_3.io_row_in_0 <= io_row_in_3_0 @[sadves.scala 246:25]
    Groups_3.io_row_in_1 <= io_row_in_3_1 @[sadves.scala 246:25]
    Groups_3.io_out_in <= UInt<1>("h0") @[sadves.scala 238:29]
    Groups_3.io_flow_ctrl <= io_flow_ctrl @[sadves.scala 247:28]
    Groups_3.io_out_ctrl <= io_out_ctrl_3 @[sadves.scala 248:27]
    Groups_3.io_col_ctrl <= io_col_ctrl_3 @[sadves.scala 249:27]