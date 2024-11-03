(set-logic ALL)
(declare-const k Int)
(declare-fun %B () (_ BitVec k))
(declare-fun %A () (_ BitVec k))
(assert (not (= (bvor %A (bvand (bvor %A %B) (bvnot (_ bv0 k)))) (bvor %A (bvxor %B (bvnot (_ bv0 k)))))))
(check-sat)