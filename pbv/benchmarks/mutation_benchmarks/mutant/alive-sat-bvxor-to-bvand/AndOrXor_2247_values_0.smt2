(set-logic ALL)
(declare-const k Int)
(declare-fun %B () (_ BitVec k))
(declare-fun %A () (_ BitVec k))
(assert (not (= (bvor (bvand %A (bvnot (_ bv0 k))) (bvxor %B (bvnot (_ bv0 k)))) (bvxor (bvand %A %B) (bvnot (_ bv0 k))))))
(check-sat)