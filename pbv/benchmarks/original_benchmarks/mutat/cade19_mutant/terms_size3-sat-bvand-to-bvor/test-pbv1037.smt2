(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvor t (bvmul s (bvshl s s))) (bvmul s (bvand t (bvshl s s)))))
(check-sat)
(exit)