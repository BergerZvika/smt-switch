(set-logic ALL)
(declare-const k Int)
(declare-fun %B () (_ BitVec k))
(declare-fun %A () (_ BitVec k))
(assert (not (= (bvand (bvxor (bvand %A %B) (_ bv15 k)) (bvor %A %B)) (bvxor %A %B))))
(assert true)
(check-sat)