(set-logic ALL)
(declare-const k Int)
(declare-fun %B () (_ BitVec k))
(declare-fun %A () (_ BitVec k))
(assert (not (not (= (bvor (bvand %A %B) (bvxor %A %B)) (bvor %A %B)))))
(check-sat)