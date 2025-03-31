(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvadd (bvand s t) (bvshl s t)) (bvor t (bvadd s (bvshl s t)))))
(check-sat)
(exit)