(set-logic ALL)
(declare-const k Int)
(declare-fun %B () (_ BitVec k))
(declare-fun %A () (_ BitVec k))
(assert (not (= (bvor (bvand (bvxor %A (bvneg (_ bv0 k))) %B) %A) (bvor %A %B))))
(check-sat)