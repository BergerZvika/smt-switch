(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand s (bvor t (bvshl s t))) (bvand s (bvsub t (bvshl s t)))))
(check-sat)
(exit)