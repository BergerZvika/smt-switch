(set-logic ALL)
(declare-const k Int)
(declare-fun %B () (_ BitVec k))
(declare-fun %A () (_ BitVec k))
(assert (let ((_let_0 (bvxor (bvxor %A (bvnot (_ bv1 k))) %B))) (not (= (bvor (bvand %A %B) _let_0) _let_0))))
(check-sat)