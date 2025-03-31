(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvshl s (bvand (bvmul t t) t)) (bvshl s (bvand t (bvmul t t))))))
(check-sat)
(exit)