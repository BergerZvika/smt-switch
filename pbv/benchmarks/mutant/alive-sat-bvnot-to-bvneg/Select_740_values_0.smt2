(set-logic ALL)
(declare-const k Int)
(declare-fun %A () (_ BitVec k))
(assert (let ((_let_0 (ite (bvsgt %A (_ bv0 k)) %A (bvsub (_ bv0 k) %A)))) (not (= (ite (bvsgt _let_0 (bvneg (_ bv0 k))) _let_0 (bvsub (_ bv0 k) _let_0)) _let_0))))
(check-sat)