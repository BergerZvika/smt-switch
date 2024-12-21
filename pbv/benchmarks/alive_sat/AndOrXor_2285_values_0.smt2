(set-logic ALL)
(declare-const k Int)
(declare-fun %B () (_ BitVec k))
(declare-fun %A () (_ BitVec k))
(assert (not (not (= (bvor %A (bvxor (bvxor %A %B) (bvnot (_ bv0 k)))) (bvor %A (bvxor %B (bvnot (_ bv0 k))))))))
(check-sat)