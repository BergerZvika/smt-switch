(set-logic ALL)
(declare-const k Int)
(declare-fun %B () (_ BitVec k))
(declare-fun %A () (_ BitVec k))
(assert (not (= (bvand (bvand %A %B) (bvxor (bvand %A %B) (bvnot (_ bv0 k)))) (bvxor %A %B))))
(check-sat)