(set-logic ALL)
(declare-const k Int)
(declare-fun %B () (_ BitVec k))
(declare-fun %A () (_ BitVec k))
(assert (let ((_let_0 (ite (bvslt %A %B) %A %B))) (not (= (ite (bvslt _let_0 %B) _let_0 %B) _let_0))))
(check-sat)