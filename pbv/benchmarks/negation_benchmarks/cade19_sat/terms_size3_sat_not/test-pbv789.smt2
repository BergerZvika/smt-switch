(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvmul s (bvand (bvmul t t) t)) (bvmul s (bvand t (bvmul t t))))))
(check-sat)
(exit)