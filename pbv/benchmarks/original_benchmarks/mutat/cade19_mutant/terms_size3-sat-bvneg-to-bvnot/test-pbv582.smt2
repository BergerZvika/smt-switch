(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvmul s (bvand (bvnot t) t)) (bvmul s (bvand t (bvneg t)))))
(check-sat)
(exit)