(set-logic ALL)
(declare-const k Int)
(declare-fun C1 () (_ BitVec k))
(declare-fun C2 () (_ BitVec k))
(declare-fun %X () (_ BitVec k))
(assert (let ((_let_0 (bvlshr %X C1))) (let ((_let_1 (bvlshr (_ bv15 k) C1))) (let ((_let_2 (bvand C2 _let_1))) (and (bvult C1 (_ bv4 k)) (not (= _let_2 _let_1)) (not (= (bvand _let_0 C2) (bvand _let_0 _let_2))))))))
(check-sat)