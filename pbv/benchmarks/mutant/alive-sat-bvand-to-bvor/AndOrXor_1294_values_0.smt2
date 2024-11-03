(set-logic ALL)
(declare-const k Int)
(declare-fun %B () (_ BitVec k))
(declare-fun %A () (_ BitVec k))
(assert (not (= (bvor (bvor %A %B) (bvxor (bvxor %A (bvnot (_ bv0 k))) %B)) (bvand %A %B))))
(check-sat)