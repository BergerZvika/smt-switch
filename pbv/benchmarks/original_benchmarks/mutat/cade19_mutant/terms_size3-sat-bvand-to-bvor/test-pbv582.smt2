(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvmul s (bvor (bvneg t) t)) (bvmul s (bvand t (bvneg t)))))
(check-sat)
(exit)