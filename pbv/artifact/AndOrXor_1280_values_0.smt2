(set-logic ALL)
(declare-const k Int)
(declare-fun %B () (_ BitVec k))
(declare-fun %A () (_ BitVec k))
(assert (not (= (bvand (bvor (bvxor %A (_ bv15 k)) %B) %A) (bvand %A %B))))
(assert true)
(check-sat)