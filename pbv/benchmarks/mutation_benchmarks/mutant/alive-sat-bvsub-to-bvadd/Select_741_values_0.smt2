(set-logic ALL)
(declare-const k Int)
(declare-fun %A () (_ BitVec k))
(assert (let ((_let_0 (ite (bvsgt %A (_ bv0 k)) (bvadd (_ bv0 k) %A) %A))) (not (= (ite (bvsgt _let_0 (bvnot (_ bv0 k))) (bvsub (_ bv0 k) _let_0) _let_0) _let_0))))
(check-sat)