(set-logic ALL)
(declare-const k Int)
(declare-fun C1 () (_ BitVec k))
(declare-fun %X () (_ BitVec k))
(declare-fun C2 () (_ BitVec k))
(assert (not (let ((_let_0 (bvult %X C1))) (and (bvult C1 C2) (= C2 (bvnot (_ bv0 k))) (not (= (or _let_0 (bvugt %X C2)) _let_0))))))
(check-sat)