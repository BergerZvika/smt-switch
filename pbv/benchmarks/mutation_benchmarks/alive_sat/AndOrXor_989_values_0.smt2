(set-logic ALL)
(declare-const k Int)
(declare-fun C2 () (_ BitVec k))
(declare-fun %a () (_ BitVec k))
(declare-fun C1 () (_ BitVec k))
(assert (not (let ((_let_0 (bvugt %a C2))) (and (bvult C1 C2) (not (= (and (bvugt %a C1) _let_0) _let_0))))))
(check-sat)