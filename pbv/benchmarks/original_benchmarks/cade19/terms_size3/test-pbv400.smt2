(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvmul s (bvand t (bvor s t))) (bvmul s t)))
(check-sat)
(exit)