(set-logic ALL)
(declare-const k Int)
(declare-fun %A () (_ BitVec k))
(assert (let ((_let_0 (bvsub (_ bv0 k) %A))) (let ((_let_1 (ite (bvslt %A (_ bv0 k)) %A _let_0))) (not (= (ite (bvsgt _let_1 (_ bv0 k)) _let_1 (bvsub (_ bv0 k) _let_1)) (ite (bvsgt %A (_ bv0 k)) %A _let_0))))))
(check-sat)