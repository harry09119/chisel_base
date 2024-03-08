circuit Base :
  module Base :
    input clock : Clock
    input reset : UInt<1>
    input io_reset : UInt<1>
    input io_next : UInt<1>
    output io_output : UInt<4>

    reg state : UInt<2>, clock with :
      reset => (UInt<1>("h0"), state) @[base.scala 23:22]
    node _state_T = eq(state, UInt<1>("h0")) @[base.scala 29:22]
    node _state_T_1 = eq(state, UInt<1>("h1")) @[base.scala 29:22]
    node _state_T_2 = eq(state, UInt<2>("h2")) @[base.scala 29:22]
    node _state_T_3 = eq(state, UInt<2>("h3")) @[base.scala 29:22]
    node _state_T_4 = mux(_state_T_2, UInt<2>("h3"), UInt<1>("h0")) @[base.scala 29:22]
    node _state_T_5 = mux(_state_T_1, UInt<2>("h2"), _state_T_4) @[base.scala 29:22]
    node _state_T_6 = mux(_state_T, UInt<1>("h1"), _state_T_5) @[base.scala 29:22]
    node _GEN_0 = mux(io_next, _state_T_6, state) @[base.scala 28:19 base.scala 29:13 base.scala 31:13]
    node _GEN_1 = mux(io_reset, UInt<1>("h0"), _GEN_0) @[base.scala 25:18 base.scala 26:11]
    node _T = eq(state, UInt<1>("h0")) @[base.scala 35:14]
    node _T_1 = eq(state, UInt<1>("h1")) @[base.scala 37:20]
    node _T_2 = eq(state, UInt<2>("h2")) @[base.scala 39:20]
    node _T_3 = eq(state, UInt<2>("h3")) @[base.scala 41:20]
    node _GEN_2 = mux(_T_3, UInt<4>("h3"), UInt<4>("hf")) @[base.scala 41:31 base.scala 42:15 base.scala 44:15]
    node _GEN_3 = mux(_T_2, UInt<4>("h2"), _GEN_2) @[base.scala 39:32 base.scala 40:15]
    node _GEN_4 = mux(_T_1, UInt<4>("h1"), _GEN_3) @[base.scala 37:31 base.scala 38:15]
    node _GEN_5 = mux(_T, UInt<4>("h0"), _GEN_4) @[base.scala 35:24 base.scala 36:15]
    io_output <= _GEN_5
    state <= mux(reset, UInt<1>("h0"), _GEN_1) @[base.scala 23:22 base.scala 23:22]