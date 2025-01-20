(set-logic ALL)
(declare-const k Int)
(declare-fun %B () (_ BitVec k))
(declare-fun %A () (_ BitVec k))
(assert (not (not (= (bvand (bvor (bvxor %A (bvnot (_ bv0 k))) %B) %A) (bvand %A %B)))))
(check-sat)