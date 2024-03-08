circuit Dense_PE_Array_sum_check :
  module DensePE_sum_check :
    input clock : Clock
    input reset : UInt<1>
    input io_l_in : UInt<4>
    input io_t_in : UInt<4>
    output io_r_out : UInt<4>
    output io_b_out : UInt<4>
    input io_s_in : UInt<11>
    output io_s_out : UInt<11>
    input io_c_state : UInt<2>
    output io_debug_PE_key : UInt<4>
    output io_debug_PE_query : UInt<4>
    output io_debug_PE_score : UInt<11>

    reg v_reg : UInt<4>, clock with :
      reset => (UInt<1>("h0"), v_reg) @[sum_check.scala 25:18]
    reg h_reg : UInt<4>, clock with :
      reset => (UInt<1>("h0"), h_reg) @[sum_check.scala 26:18]
    reg s_reg : UInt<11>, clock with :
      reset => (UInt<1>("h0"), s_reg) @[sum_check.scala 28:18]
    node _T = eq(UInt<2>("h0"), io_c_state) @[Conditional.scala 37:30]
    node _T_1 = eq(UInt<2>("h1"), io_c_state) @[Conditional.scala 37:30]
    node _T_2 = eq(UInt<2>("h2"), io_c_state) @[Conditional.scala 37:30]
    node _s_reg_T = mul(v_reg, h_reg) @[sum_check.scala 52:30]
    node _s_reg_T_1 = add(s_reg, _s_reg_T) @[sum_check.scala 52:22]
    node _s_reg_T_2 = tail(_s_reg_T_1, 1) @[sum_check.scala 52:22]
    node _T_3 = eq(UInt<2>("h3"), io_c_state) @[Conditional.scala 37:30]
    node _GEN_0 = mux(_T_3, io_s_in, s_reg) @[Conditional.scala 39:67 sum_check.scala 55:13 sum_check.scala 28:18]
    node _GEN_1 = mux(_T_3, v_reg, v_reg) @[Conditional.scala 39:67 sum_check.scala 56:13 sum_check.scala 25:18]
    node _GEN_2 = mux(_T_3, h_reg, h_reg) @[Conditional.scala 39:67 sum_check.scala 57:13 sum_check.scala 26:18]
    node _GEN_3 = mux(_T_2, io_t_in, _GEN_1) @[Conditional.scala 39:67 sum_check.scala 50:13]
    node _GEN_4 = mux(_T_2, io_l_in, _GEN_2) @[Conditional.scala 39:67 sum_check.scala 51:13]
    node _GEN_5 = mux(_T_2, _s_reg_T_2, _GEN_0) @[Conditional.scala 39:67 sum_check.scala 52:13]
    node _GEN_6 = mux(_T_1, UInt<1>("h0"), _GEN_3) @[Conditional.scala 39:67 sum_check.scala 45:13]
    node _GEN_7 = mux(_T_1, UInt<1>("h0"), _GEN_4) @[Conditional.scala 39:67 sum_check.scala 46:13]
    node _GEN_8 = mux(_T_1, UInt<1>("h0"), _GEN_5) @[Conditional.scala 39:67 sum_check.scala 47:13]
    node _GEN_9 = mux(_T, v_reg, _GEN_6) @[Conditional.scala 40:58 sum_check.scala 40:13]
    node _GEN_10 = mux(_T, h_reg, _GEN_7) @[Conditional.scala 40:58 sum_check.scala 41:13]
    node _GEN_11 = mux(_T, s_reg, _GEN_8) @[Conditional.scala 40:58 sum_check.scala 42:13]
    io_r_out <= h_reg @[sum_check.scala 31:12]
    io_b_out <= v_reg @[sum_check.scala 30:12]
    io_s_out <= s_reg @[sum_check.scala 32:12]
    io_debug_PE_key <= v_reg @[sum_check.scala 34:19]
    io_debug_PE_query <= h_reg @[sum_check.scala 35:21]
    io_debug_PE_score <= s_reg @[sum_check.scala 36:21]
    v_reg <= _GEN_9
    h_reg <= _GEN_10
    s_reg <= _GEN_11

  module Dense_PE_Array_sum_check :
    input clock : Clock
    input reset : UInt<1>
    input io_l_in_0 : UInt<4>
    input io_l_in_1 : UInt<4>
    input io_l_in_2 : UInt<4>
    input io_l_in_3 : UInt<4>
    input io_t_in_0 : UInt<4>
    input io_t_in_1 : UInt<4>
    input io_t_in_2 : UInt<4>
    input io_t_in_3 : UInt<4>
    input io_t_in_4 : UInt<4>
    input io_t_in_5 : UInt<4>
    input io_t_in_6 : UInt<4>
    output io_s_out_0 : UInt<11>
    output io_s_out_1 : UInt<11>
    output io_s_out_2 : UInt<11>
    output io_s_out_3 : UInt<11>
    input io_c_pestate : UInt<2>
    input io_c_astate : UInt<2>
    output io_debug_pearray_key_0_0 : UInt<4>
    output io_debug_pearray_key_0_1 : UInt<4>
    output io_debug_pearray_key_0_2 : UInt<4>
    output io_debug_pearray_key_0_3 : UInt<4>
    output io_debug_pearray_key_1_0 : UInt<4>
    output io_debug_pearray_key_1_1 : UInt<4>
    output io_debug_pearray_key_1_2 : UInt<4>
    output io_debug_pearray_key_1_3 : UInt<4>
    output io_debug_pearray_key_2_0 : UInt<4>
    output io_debug_pearray_key_2_1 : UInt<4>
    output io_debug_pearray_key_2_2 : UInt<4>
    output io_debug_pearray_key_2_3 : UInt<4>
    output io_debug_pearray_key_3_0 : UInt<4>
    output io_debug_pearray_key_3_1 : UInt<4>
    output io_debug_pearray_key_3_2 : UInt<4>
    output io_debug_pearray_key_3_3 : UInt<4>
    output io_debug_pearray_query_0_0 : UInt<4>
    output io_debug_pearray_query_0_1 : UInt<4>
    output io_debug_pearray_query_0_2 : UInt<4>
    output io_debug_pearray_query_0_3 : UInt<4>
    output io_debug_pearray_query_1_0 : UInt<4>
    output io_debug_pearray_query_1_1 : UInt<4>
    output io_debug_pearray_query_1_2 : UInt<4>
    output io_debug_pearray_query_1_3 : UInt<4>
    output io_debug_pearray_query_2_0 : UInt<4>
    output io_debug_pearray_query_2_1 : UInt<4>
    output io_debug_pearray_query_2_2 : UInt<4>
    output io_debug_pearray_query_2_3 : UInt<4>
    output io_debug_pearray_query_3_0 : UInt<4>
    output io_debug_pearray_query_3_1 : UInt<4>
    output io_debug_pearray_query_3_2 : UInt<4>
    output io_debug_pearray_query_3_3 : UInt<4>
    output io_debug_pearray_score_0_0 : UInt<11>
    output io_debug_pearray_score_0_1 : UInt<11>
    output io_debug_pearray_score_0_2 : UInt<11>
    output io_debug_pearray_score_0_3 : UInt<11>
    output io_debug_pearray_score_1_0 : UInt<11>
    output io_debug_pearray_score_1_1 : UInt<11>
    output io_debug_pearray_score_1_2 : UInt<11>
    output io_debug_pearray_score_1_3 : UInt<11>
    output io_debug_pearray_score_2_0 : UInt<11>
    output io_debug_pearray_score_2_1 : UInt<11>
    output io_debug_pearray_score_2_2 : UInt<11>
    output io_debug_pearray_score_2_3 : UInt<11>
    output io_debug_pearray_score_3_0 : UInt<11>
    output io_debug_pearray_score_3_1 : UInt<11>
    output io_debug_pearray_score_3_2 : UInt<11>
    output io_debug_pearray_score_3_3 : UInt<11>

    inst pes_0_0 of DensePE_sum_check @[sum_check.scala 94:50]
    inst pes_0_1 of DensePE_sum_check @[sum_check.scala 94:50]
    inst pes_0_2 of DensePE_sum_check @[sum_check.scala 94:50]
    inst pes_0_3 of DensePE_sum_check @[sum_check.scala 94:50]
    inst pes_1_0 of DensePE_sum_check @[sum_check.scala 94:50]
    inst pes_1_1 of DensePE_sum_check @[sum_check.scala 94:50]
    inst pes_1_2 of DensePE_sum_check @[sum_check.scala 94:50]
    inst pes_1_3 of DensePE_sum_check @[sum_check.scala 94:50]
    inst pes_2_0 of DensePE_sum_check @[sum_check.scala 94:50]
    inst pes_2_1 of DensePE_sum_check @[sum_check.scala 94:50]
    inst pes_2_2 of DensePE_sum_check @[sum_check.scala 94:50]
    inst pes_2_3 of DensePE_sum_check @[sum_check.scala 94:50]
    inst pes_3_0 of DensePE_sum_check @[sum_check.scala 94:50]
    inst pes_3_1 of DensePE_sum_check @[sum_check.scala 94:50]
    inst pes_3_2 of DensePE_sum_check @[sum_check.scala 94:50]
    inst pes_3_3 of DensePE_sum_check @[sum_check.scala 94:50]
    io_s_out_0 <= pes_0_3.io_s_out @[sum_check.scala 145:19]
    io_s_out_1 <= pes_1_3.io_s_out @[sum_check.scala 145:19]
    io_s_out_2 <= pes_2_3.io_s_out @[sum_check.scala 145:19]
    io_s_out_3 <= pes_3_3.io_s_out @[sum_check.scala 145:19]
    io_debug_pearray_key_0_0 <= pes_0_0.io_debug_PE_key @[sum_check.scala 138:34]
    io_debug_pearray_key_0_1 <= pes_0_1.io_debug_PE_key @[sum_check.scala 138:34]
    io_debug_pearray_key_0_2 <= pes_0_2.io_debug_PE_key @[sum_check.scala 138:34]
    io_debug_pearray_key_0_3 <= pes_0_3.io_debug_PE_key @[sum_check.scala 138:34]
    io_debug_pearray_key_1_0 <= pes_1_0.io_debug_PE_key @[sum_check.scala 138:34]
    io_debug_pearray_key_1_1 <= pes_1_1.io_debug_PE_key @[sum_check.scala 138:34]
    io_debug_pearray_key_1_2 <= pes_1_2.io_debug_PE_key @[sum_check.scala 138:34]
    io_debug_pearray_key_1_3 <= pes_1_3.io_debug_PE_key @[sum_check.scala 138:34]
    io_debug_pearray_key_2_0 <= pes_2_0.io_debug_PE_key @[sum_check.scala 138:34]
    io_debug_pearray_key_2_1 <= pes_2_1.io_debug_PE_key @[sum_check.scala 138:34]
    io_debug_pearray_key_2_2 <= pes_2_2.io_debug_PE_key @[sum_check.scala 138:34]
    io_debug_pearray_key_2_3 <= pes_2_3.io_debug_PE_key @[sum_check.scala 138:34]
    io_debug_pearray_key_3_0 <= pes_3_0.io_debug_PE_key @[sum_check.scala 138:34]
    io_debug_pearray_key_3_1 <= pes_3_1.io_debug_PE_key @[sum_check.scala 138:34]
    io_debug_pearray_key_3_2 <= pes_3_2.io_debug_PE_key @[sum_check.scala 138:34]
    io_debug_pearray_key_3_3 <= pes_3_3.io_debug_PE_key @[sum_check.scala 138:34]
    io_debug_pearray_query_0_0 <= pes_0_0.io_debug_PE_query @[sum_check.scala 139:36]
    io_debug_pearray_query_0_1 <= pes_0_1.io_debug_PE_query @[sum_check.scala 139:36]
    io_debug_pearray_query_0_2 <= pes_0_2.io_debug_PE_query @[sum_check.scala 139:36]
    io_debug_pearray_query_0_3 <= pes_0_3.io_debug_PE_query @[sum_check.scala 139:36]
    io_debug_pearray_query_1_0 <= pes_1_0.io_debug_PE_query @[sum_check.scala 139:36]
    io_debug_pearray_query_1_1 <= pes_1_1.io_debug_PE_query @[sum_check.scala 139:36]
    io_debug_pearray_query_1_2 <= pes_1_2.io_debug_PE_query @[sum_check.scala 139:36]
    io_debug_pearray_query_1_3 <= pes_1_3.io_debug_PE_query @[sum_check.scala 139:36]
    io_debug_pearray_query_2_0 <= pes_2_0.io_debug_PE_query @[sum_check.scala 139:36]
    io_debug_pearray_query_2_1 <= pes_2_1.io_debug_PE_query @[sum_check.scala 139:36]
    io_debug_pearray_query_2_2 <= pes_2_2.io_debug_PE_query @[sum_check.scala 139:36]
    io_debug_pearray_query_2_3 <= pes_2_3.io_debug_PE_query @[sum_check.scala 139:36]
    io_debug_pearray_query_3_0 <= pes_3_0.io_debug_PE_query @[sum_check.scala 139:36]
    io_debug_pearray_query_3_1 <= pes_3_1.io_debug_PE_query @[sum_check.scala 139:36]
    io_debug_pearray_query_3_2 <= pes_3_2.io_debug_PE_query @[sum_check.scala 139:36]
    io_debug_pearray_query_3_3 <= pes_3_3.io_debug_PE_query @[sum_check.scala 139:36]
    io_debug_pearray_score_0_0 <= pes_0_0.io_debug_PE_score @[sum_check.scala 140:36]
    io_debug_pearray_score_0_1 <= pes_0_1.io_debug_PE_score @[sum_check.scala 140:36]
    io_debug_pearray_score_0_2 <= pes_0_2.io_debug_PE_score @[sum_check.scala 140:36]
    io_debug_pearray_score_0_3 <= pes_0_3.io_debug_PE_score @[sum_check.scala 140:36]
    io_debug_pearray_score_1_0 <= pes_1_0.io_debug_PE_score @[sum_check.scala 140:36]
    io_debug_pearray_score_1_1 <= pes_1_1.io_debug_PE_score @[sum_check.scala 140:36]
    io_debug_pearray_score_1_2 <= pes_1_2.io_debug_PE_score @[sum_check.scala 140:36]
    io_debug_pearray_score_1_3 <= pes_1_3.io_debug_PE_score @[sum_check.scala 140:36]
    io_debug_pearray_score_2_0 <= pes_2_0.io_debug_PE_score @[sum_check.scala 140:36]
    io_debug_pearray_score_2_1 <= pes_2_1.io_debug_PE_score @[sum_check.scala 140:36]
    io_debug_pearray_score_2_2 <= pes_2_2.io_debug_PE_score @[sum_check.scala 140:36]
    io_debug_pearray_score_2_3 <= pes_2_3.io_debug_PE_score @[sum_check.scala 140:36]
    io_debug_pearray_score_3_0 <= pes_3_0.io_debug_PE_score @[sum_check.scala 140:36]
    io_debug_pearray_score_3_1 <= pes_3_1.io_debug_PE_score @[sum_check.scala 140:36]
    io_debug_pearray_score_3_2 <= pes_3_2.io_debug_PE_score @[sum_check.scala 140:36]
    io_debug_pearray_score_3_3 <= pes_3_3.io_debug_PE_score @[sum_check.scala 140:36]
    pes_0_0.clock <= clock
    pes_0_0.reset <= reset
    pes_0_0.io_l_in <= io_l_in_0 @[sum_check.scala 104:23]
    pes_0_0.io_t_in <= io_t_in_0 @[sum_check.scala 109:23]
    pes_0_0.io_s_in <= UInt<1>("h0") @[sum_check.scala 105:23]
    pes_0_0.io_c_state <= io_c_pestate @[sum_check.scala 137:28]
    pes_0_1.clock <= clock
    pes_0_1.reset <= reset
    pes_0_1.io_l_in <= pes_0_0.io_r_out @[sum_check.scala 123:25]
    pes_0_1.io_t_in <= io_t_in_1 @[sum_check.scala 109:23]
    pes_0_1.io_s_in <= pes_0_0.io_s_out @[sum_check.scala 124:25]
    pes_0_1.io_c_state <= io_c_pestate @[sum_check.scala 137:28]
    pes_0_2.clock <= clock
    pes_0_2.reset <= reset
    pes_0_2.io_l_in <= pes_0_1.io_r_out @[sum_check.scala 123:25]
    pes_0_2.io_t_in <= io_t_in_2 @[sum_check.scala 109:23]
    pes_0_2.io_s_in <= pes_0_1.io_s_out @[sum_check.scala 124:25]
    pes_0_2.io_c_state <= io_c_pestate @[sum_check.scala 137:28]
    pes_0_3.clock <= clock
    pes_0_3.reset <= reset
    pes_0_3.io_l_in <= pes_0_2.io_r_out @[sum_check.scala 123:25]
    pes_0_3.io_t_in <= io_t_in_3 @[sum_check.scala 109:23]
    pes_0_3.io_s_in <= pes_0_2.io_s_out @[sum_check.scala 124:25]
    pes_0_3.io_c_state <= io_c_pestate @[sum_check.scala 137:28]
    pes_1_0.clock <= clock
    pes_1_0.reset <= reset
    pes_1_0.io_l_in <= io_l_in_1 @[sum_check.scala 104:23]
    pes_1_0.io_t_in <= io_t_in_4 @[sum_check.scala 117:23]
    pes_1_0.io_s_in <= UInt<1>("h0") @[sum_check.scala 105:23]
    pes_1_0.io_c_state <= io_c_pestate @[sum_check.scala 137:28]
    pes_1_1.clock <= clock
    pes_1_1.reset <= reset
    pes_1_1.io_l_in <= pes_1_0.io_r_out @[sum_check.scala 123:25]
    pes_1_1.io_t_in <= pes_0_0.io_b_out @[sum_check.scala 131:27]
    pes_1_1.io_s_in <= pes_1_0.io_s_out @[sum_check.scala 124:25]
    pes_1_1.io_c_state <= io_c_pestate @[sum_check.scala 137:28]
    pes_1_2.clock <= clock
    pes_1_2.reset <= reset
    pes_1_2.io_l_in <= pes_1_1.io_r_out @[sum_check.scala 123:25]
    pes_1_2.io_t_in <= pes_0_1.io_b_out @[sum_check.scala 131:27]
    pes_1_2.io_s_in <= pes_1_1.io_s_out @[sum_check.scala 124:25]
    pes_1_2.io_c_state <= io_c_pestate @[sum_check.scala 137:28]
    pes_1_3.clock <= clock
    pes_1_3.reset <= reset
    pes_1_3.io_l_in <= pes_1_2.io_r_out @[sum_check.scala 123:25]
    pes_1_3.io_t_in <= pes_0_2.io_b_out @[sum_check.scala 131:27]
    pes_1_3.io_s_in <= pes_1_2.io_s_out @[sum_check.scala 124:25]
    pes_1_3.io_c_state <= io_c_pestate @[sum_check.scala 137:28]
    pes_2_0.clock <= clock
    pes_2_0.reset <= reset
    pes_2_0.io_l_in <= io_l_in_2 @[sum_check.scala 104:23]
    pes_2_0.io_t_in <= io_t_in_5 @[sum_check.scala 117:23]
    pes_2_0.io_s_in <= UInt<1>("h0") @[sum_check.scala 105:23]
    pes_2_0.io_c_state <= io_c_pestate @[sum_check.scala 137:28]
    pes_2_1.clock <= clock
    pes_2_1.reset <= reset
    pes_2_1.io_l_in <= pes_2_0.io_r_out @[sum_check.scala 123:25]
    pes_2_1.io_t_in <= pes_1_0.io_b_out @[sum_check.scala 131:27]
    pes_2_1.io_s_in <= pes_2_0.io_s_out @[sum_check.scala 124:25]
    pes_2_1.io_c_state <= io_c_pestate @[sum_check.scala 137:28]
    pes_2_2.clock <= clock
    pes_2_2.reset <= reset
    pes_2_2.io_l_in <= pes_2_1.io_r_out @[sum_check.scala 123:25]
    pes_2_2.io_t_in <= pes_1_1.io_b_out @[sum_check.scala 131:27]
    pes_2_2.io_s_in <= pes_2_1.io_s_out @[sum_check.scala 124:25]
    pes_2_2.io_c_state <= io_c_pestate @[sum_check.scala 137:28]
    pes_2_3.clock <= clock
    pes_2_3.reset <= reset
    pes_2_3.io_l_in <= pes_2_2.io_r_out @[sum_check.scala 123:25]
    pes_2_3.io_t_in <= pes_1_2.io_b_out @[sum_check.scala 131:27]
    pes_2_3.io_s_in <= pes_2_2.io_s_out @[sum_check.scala 124:25]
    pes_2_3.io_c_state <= io_c_pestate @[sum_check.scala 137:28]
    pes_3_0.clock <= clock
    pes_3_0.reset <= reset
    pes_3_0.io_l_in <= io_l_in_3 @[sum_check.scala 104:23]
    pes_3_0.io_t_in <= io_t_in_6 @[sum_check.scala 117:23]
    pes_3_0.io_s_in <= UInt<1>("h0") @[sum_check.scala 105:23]
    pes_3_0.io_c_state <= io_c_pestate @[sum_check.scala 137:28]
    pes_3_1.clock <= clock
    pes_3_1.reset <= reset
    pes_3_1.io_l_in <= pes_3_0.io_r_out @[sum_check.scala 123:25]
    pes_3_1.io_t_in <= pes_2_0.io_b_out @[sum_check.scala 131:27]
    pes_3_1.io_s_in <= pes_3_0.io_s_out @[sum_check.scala 124:25]
    pes_3_1.io_c_state <= io_c_pestate @[sum_check.scala 137:28]
    pes_3_2.clock <= clock
    pes_3_2.reset <= reset
    pes_3_2.io_l_in <= pes_3_1.io_r_out @[sum_check.scala 123:25]
    pes_3_2.io_t_in <= pes_2_1.io_b_out @[sum_check.scala 131:27]
    pes_3_2.io_s_in <= pes_3_1.io_s_out @[sum_check.scala 124:25]
    pes_3_2.io_c_state <= io_c_pestate @[sum_check.scala 137:28]
    pes_3_3.clock <= clock
    pes_3_3.reset <= reset
    pes_3_3.io_l_in <= pes_3_2.io_r_out @[sum_check.scala 123:25]
    pes_3_3.io_t_in <= pes_2_2.io_b_out @[sum_check.scala 131:27]
    pes_3_3.io_s_in <= pes_3_2.io_s_out @[sum_check.scala 124:25]
    pes_3_3.io_c_state <= io_c_pestate @[sum_check.scala 137:28]