(set-logic ALL)
(declare-const k Int)
(declare-fun C2 () (_ BitVec k))
(declare-fun %X () (_ BitVec k))
(declare-fun C1 () (_ BitVec k))
(assert (let ((_let_0 (bvult %X C2))) (and (bvult C1 C2) (not (= (or (bvult %X C1) _let_0) _let_0)))))
(check-sat)