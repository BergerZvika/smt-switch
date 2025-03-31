(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvmul s (bvand (bvsub t t) t)) (bvmul s (bvand t (bvadd t t)))))
(check-sat)
(exit)