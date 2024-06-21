(set-logic ALL)
(declare-const k Int)
(declare-fun %B () (_ BitVec k))
(declare-fun %A () (_ BitVec k))
(assert (not (not (= (bvand (bvxor (bvand %A %B) (bvnot (_ bv0 k))) (bvor %A %B)) (bvxor %A %B)))))
(check-sat)