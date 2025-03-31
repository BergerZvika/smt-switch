(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand (bvshl s t) (bvshl t t)) (bvshl (bvand s t) t)))
(check-sat)
(exit)