(set-logic ALL)
(declare-const k Int)
(declare-fun C1 () (_ BitVec k))
(declare-fun %A () (_ BitVec k))
(declare-fun C2 () (_ BitVec k))
(assert (not (let ((_let_0 (ite (bvslt %A C1) %A C1))) (and (bvslt C1 C2) (not (= (ite (bvslt _let_0 C2) _let_0 C2) _let_0))))))
(check-sat)