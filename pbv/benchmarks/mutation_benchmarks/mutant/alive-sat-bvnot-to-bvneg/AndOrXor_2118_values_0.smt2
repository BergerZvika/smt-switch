(set-logic ALL)
(declare-const k Int)
(declare-fun %B () (_ BitVec k))
(declare-fun %A () (_ BitVec k))
(assert (let ((_let_0 (bvxor %A (bvneg (_ bv0 k))))) (not (= (bvor (bvand %A %B) _let_0) (bvor _let_0 %B)))))
(check-sat)