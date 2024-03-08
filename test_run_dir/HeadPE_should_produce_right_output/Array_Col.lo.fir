circuit Array_Col :
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
    node _T = eq(io_out_index, UInt<1>("h1")) @[my_array.scala 33:21]
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

  module PEGroup :
    input clock : Clock
    input reset : UInt<1>
    input io_col_in_0 : UInt<8>
    input io_col_in_1 : UInt<8>
    input io_col_in_2 : UInt<8>
    input io_col_in_3 : UInt<8>
    input io_row_in_0 : UInt<8>
    input io_row_in_1 : UInt<8>
    input io_row_in_2 : UInt<8>
    input io_row_in_3 : UInt<8>
    output io_row_out_0 : UInt<8>
    output io_row_out_1 : UInt<8>
    output io_row_out_2 : UInt<8>
    output io_row_out_3 : UInt<8>
    input io_out_in : UInt<20>
    output io_out_out : UInt<20>
    input io_window_index : UInt<2>
    input io_cmd_0 : UInt<3>
    input io_cmd_1 : UInt<3>
    input io_cmd_2 : UInt<3>
    input io_cmd_3 : UInt<3>
    output io_debug_0_0 : UInt<20>
    output io_debug_0_1 : UInt<20>
    output io_debug_1_0 : UInt<20>
    output io_debug_1_1 : UInt<20>
    output io_debug_2_0 : UInt<20>
    output io_debug_2_1 : UInt<20>
    output io_debug_3_0 : UInt<20>
    output io_debug_3_1 : UInt<20>

    inst head of HeadPE @[my_array.scala 150:20]
    inst body_0 of PE @[my_array.scala 151:54]
    inst body_1 of PE @[my_array.scala 151:54]
    inst body_2 of PE @[my_array.scala 151:54]
    node _head_io_flow_index_T = bits(io_cmd_0, 2, 1) @[my_array.scala 163:38]
    node _head_io_out_index_T = bits(io_cmd_0, 0, 0) @[my_array.scala 164:37]
    node _body_0_io_flow_index_T = bits(io_cmd_1, 2, 1) @[my_array.scala 172:43]
    node _body_0_io_out_index_T = bits(io_cmd_1, 0, 0) @[my_array.scala 173:42]
    node _body_1_io_flow_index_T = bits(io_cmd_2, 2, 1) @[my_array.scala 182:43]
    node _body_1_io_out_index_T = bits(io_cmd_2, 0, 0) @[my_array.scala 183:42]
    node _body_2_io_flow_index_T = bits(io_cmd_3, 2, 1) @[my_array.scala 182:43]
    node _body_2_io_out_index_T = bits(io_cmd_3, 0, 0) @[my_array.scala 183:42]
    io_row_out_0 <= head.io_row_out @[my_array.scala 161:21]
    io_row_out_1 <= body_0.io_row_out @[my_array.scala 171:21]
    io_row_out_2 <= body_1.io_row_out @[my_array.scala 181:21]
    io_row_out_3 <= body_2.io_row_out @[my_array.scala 181:21]
    io_out_out <= head.io_out_out @[my_array.scala 153:14]
    io_debug_0_0 <= head.io_debug_0 @[my_array.scala 165:22]
    io_debug_0_1 <= head.io_debug_1 @[my_array.scala 166:22]
    io_debug_1_0 <= body_0.io_debug_0 @[my_array.scala 175:22]
    io_debug_1_1 <= body_0.io_debug_1 @[my_array.scala 176:22]
    io_debug_2_0 <= body_1.io_debug_0 @[my_array.scala 185:22]
    io_debug_2_1 <= body_1.io_debug_1 @[my_array.scala 186:22]
    io_debug_3_0 <= body_2.io_debug_0 @[my_array.scala 185:22]
    io_debug_3_1 <= body_2.io_debug_1 @[my_array.scala 186:22]
    head.clock <= clock
    head.reset <= reset
    head.io_col_in_0 <= io_col_in_0 @[my_array.scala 158:27]
    head.io_col_in_1 <= io_col_in_1 @[my_array.scala 158:27]
    head.io_col_in_2 <= io_col_in_2 @[my_array.scala 158:27]
    head.io_col_in_3 <= io_col_in_3 @[my_array.scala 158:27]
    head.io_row_in <= io_row_in_0 @[my_array.scala 160:22]
    head.io_out_in <= body_0.io_out_out @[my_array.scala 174:22]
    head.io_flow_index <= _head_io_flow_index_T @[my_array.scala 163:26]
    head.io_window_index <= io_window_index @[my_array.scala 162:28]
    head.io_out_index <= _head_io_out_index_T @[my_array.scala 164:25]
    body_0.clock <= clock
    body_0.reset <= reset
    body_0.io_col_in <= head.io_col_out @[my_array.scala 169:27]
    body_0.io_row_in <= io_row_in_1 @[my_array.scala 170:27]
    body_0.io_out_in <= body_1.io_out_out @[my_array.scala 184:27]
    body_0.io_flow_index <= _body_0_io_flow_index_T @[my_array.scala 172:31]
    body_0.io_out_index <= _body_0_io_out_index_T @[my_array.scala 173:30]
    body_1.clock <= clock
    body_1.reset <= reset
    body_1.io_col_in <= body_0.io_col_out @[my_array.scala 179:27]
    body_1.io_row_in <= io_row_in_2 @[my_array.scala 180:27]
    body_1.io_out_in <= body_2.io_out_out @[my_array.scala 184:27]
    body_1.io_flow_index <= _body_1_io_flow_index_T @[my_array.scala 182:31]
    body_1.io_out_index <= _body_1_io_out_index_T @[my_array.scala 183:30]
    body_2.clock <= clock
    body_2.reset <= reset
    body_2.io_col_in <= body_1.io_col_out @[my_array.scala 179:27]
    body_2.io_row_in <= io_row_in_3 @[my_array.scala 180:27]
    body_2.io_out_in <= io_out_in @[my_array.scala 154:21]
    body_2.io_flow_index <= _body_2_io_flow_index_T @[my_array.scala 182:31]
    body_2.io_out_index <= _body_2_io_out_index_T @[my_array.scala 183:30]

  module Array_Col :
    input clock : Clock
    input reset : UInt<1>
    input io_col_in_0 : UInt<8>
    input io_col_in_1 : UInt<8>
    input io_col_in_2 : UInt<8>
    input io_col_in_3 : UInt<8>
    input io_row_in_0 : UInt<8>
    input io_row_in_1 : UInt<8>
    input io_row_in_2 : UInt<8>
    input io_row_in_3 : UInt<8>
    input io_row_in_4 : UInt<8>
    input io_row_in_5 : UInt<8>
    input io_row_in_6 : UInt<8>
    input io_row_in_7 : UInt<8>
    output io_row_out_0 : UInt<8>
    output io_row_out_1 : UInt<8>
    output io_row_out_2 : UInt<8>
    output io_row_out_3 : UInt<8>
    output io_row_out_4 : UInt<8>
    output io_row_out_5 : UInt<8>
    output io_row_out_6 : UInt<8>
    output io_row_out_7 : UInt<8>
    input io_out_in : UInt<20>
    output io_out_out : UInt<20>
    input io_window_index_0 : UInt<2>
    input io_window_index_1 : UInt<2>
    input io_cmd_0 : UInt<3>
    input io_cmd_1 : UInt<3>
    input io_cmd_2 : UInt<3>
    input io_cmd_3 : UInt<3>
    input io_cmd_4 : UInt<3>
    input io_cmd_5 : UInt<3>
    input io_cmd_6 : UInt<3>
    input io_cmd_7 : UInt<3>
    output io_debug_0_0 : UInt<20>
    output io_debug_0_1 : UInt<20>
    output io_debug_1_0 : UInt<20>
    output io_debug_1_1 : UInt<20>
    output io_debug_2_0 : UInt<20>
    output io_debug_2_1 : UInt<20>
    output io_debug_3_0 : UInt<20>
    output io_debug_3_1 : UInt<20>
    output io_debug_4_0 : UInt<20>
    output io_debug_4_1 : UInt<20>
    output io_debug_5_0 : UInt<20>
    output io_debug_5_1 : UInt<20>
    output io_debug_6_0 : UInt<20>
    output io_debug_6_1 : UInt<20>
    output io_debug_7_0 : UInt<20>
    output io_debug_7_1 : UInt<20>

    inst groups_0 of PEGroup @[my_array.scala 206:53]
    inst groups_1 of PEGroup @[my_array.scala 206:53]
    io_row_out_0 <= groups_0.io_row_out_0 @[my_array.scala 213:36]
    io_row_out_1 <= groups_0.io_row_out_1 @[my_array.scala 213:36]
    io_row_out_2 <= groups_0.io_row_out_2 @[my_array.scala 213:36]
    io_row_out_3 <= groups_0.io_row_out_3 @[my_array.scala 213:36]
    io_row_out_4 <= groups_1.io_row_out_0 @[my_array.scala 213:36]
    io_row_out_5 <= groups_1.io_row_out_1 @[my_array.scala 213:36]
    io_row_out_6 <= groups_1.io_row_out_2 @[my_array.scala 213:36]
    io_row_out_7 <= groups_1.io_row_out_3 @[my_array.scala 213:36]
    io_out_out <= groups_0.io_out_out @[my_array.scala 220:18]
    io_debug_0_0 <= groups_0.io_debug_0_0 @[my_array.scala 215:32]
    io_debug_0_1 <= groups_0.io_debug_0_1 @[my_array.scala 215:32]
    io_debug_1_0 <= groups_0.io_debug_1_0 @[my_array.scala 215:32]
    io_debug_1_1 <= groups_0.io_debug_1_1 @[my_array.scala 215:32]
    io_debug_2_0 <= groups_0.io_debug_2_0 @[my_array.scala 215:32]
    io_debug_2_1 <= groups_0.io_debug_2_1 @[my_array.scala 215:32]
    io_debug_3_0 <= groups_0.io_debug_3_0 @[my_array.scala 215:32]
    io_debug_3_1 <= groups_0.io_debug_3_1 @[my_array.scala 215:32]
    io_debug_4_0 <= groups_1.io_debug_0_0 @[my_array.scala 215:32]
    io_debug_4_1 <= groups_1.io_debug_0_1 @[my_array.scala 215:32]
    io_debug_5_0 <= groups_1.io_debug_1_0 @[my_array.scala 215:32]
    io_debug_5_1 <= groups_1.io_debug_1_1 @[my_array.scala 215:32]
    io_debug_6_0 <= groups_1.io_debug_2_0 @[my_array.scala 215:32]
    io_debug_6_1 <= groups_1.io_debug_2_1 @[my_array.scala 215:32]
    io_debug_7_0 <= groups_1.io_debug_3_0 @[my_array.scala 215:32]
    io_debug_7_1 <= groups_1.io_debug_3_1 @[my_array.scala 215:32]
    groups_0.clock <= clock
    groups_0.reset <= reset
    groups_0.io_col_in_0 <= io_col_in_0 @[my_array.scala 209:30]
    groups_0.io_col_in_1 <= io_col_in_1 @[my_array.scala 209:30]
    groups_0.io_col_in_2 <= io_col_in_2 @[my_array.scala 209:30]
    groups_0.io_col_in_3 <= io_col_in_3 @[my_array.scala 209:30]
    groups_0.io_row_in_0 <= io_row_in_0 @[my_array.scala 212:30]
    groups_0.io_row_in_1 <= io_row_in_1 @[my_array.scala 212:30]
    groups_0.io_row_in_2 <= io_row_in_2 @[my_array.scala 212:30]
    groups_0.io_row_in_3 <= io_row_in_3 @[my_array.scala 212:30]
    groups_0.io_out_in <= groups_1.io_out_out @[my_array.scala 222:29]
    groups_0.io_window_index <= io_window_index_0 @[my_array.scala 217:31]
    groups_0.io_cmd_0 <= io_cmd_0 @[my_array.scala 214:27]
    groups_0.io_cmd_1 <= io_cmd_1 @[my_array.scala 214:27]
    groups_0.io_cmd_2 <= io_cmd_2 @[my_array.scala 214:27]
    groups_0.io_cmd_3 <= io_cmd_3 @[my_array.scala 214:27]
    groups_1.clock <= clock
    groups_1.reset <= reset
    groups_1.io_col_in_0 <= io_col_in_0 @[my_array.scala 209:30]
    groups_1.io_col_in_1 <= io_col_in_1 @[my_array.scala 209:30]
    groups_1.io_col_in_2 <= io_col_in_2 @[my_array.scala 209:30]
    groups_1.io_col_in_3 <= io_col_in_3 @[my_array.scala 209:30]
    groups_1.io_row_in_0 <= io_row_in_4 @[my_array.scala 212:30]
    groups_1.io_row_in_1 <= io_row_in_5 @[my_array.scala 212:30]
    groups_1.io_row_in_2 <= io_row_in_6 @[my_array.scala 212:30]
    groups_1.io_row_in_3 <= io_row_in_7 @[my_array.scala 212:30]
    groups_1.io_out_in <= UInt<1>("h0") @[my_array.scala 224:33]
    groups_1.io_window_index <= io_window_index_1 @[my_array.scala 217:31]
    groups_1.io_cmd_0 <= io_cmd_4 @[my_array.scala 214:27]
    groups_1.io_cmd_1 <= io_cmd_5 @[my_array.scala 214:27]
    groups_1.io_cmd_2 <= io_cmd_6 @[my_array.scala 214:27]
    groups_1.io_cmd_3 <= io_cmd_7 @[my_array.scala 214:27]