(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand (bvmul s t) (bvand s t)) (bvand s (bvand t (bvmul s t)))))
(check-sat)
(exit)