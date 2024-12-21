(set-logic ALL)
(declare-const k Int)
(declare-fun %B () (_ BitVec k))
(declare-fun %A () (_ BitVec k))
(assert (not (= (bvand (bvxor %A %B) %A) (bvand %A (bvxor %B (bvnot (_ bv1 k)))))))
(check-sat)