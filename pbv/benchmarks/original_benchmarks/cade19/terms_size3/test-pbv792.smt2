(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvor s (bvand (bvmul t t) t)) (bvor s (bvand t (bvmul t t)))))
(check-sat)
(exit)