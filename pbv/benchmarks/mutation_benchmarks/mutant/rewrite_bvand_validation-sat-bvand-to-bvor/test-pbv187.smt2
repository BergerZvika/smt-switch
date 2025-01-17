(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvor t (bvshl s s)) (bvshl t t)) (bvand (bvshl s s) (bvshl t (bvshl s t)))))
(check-sat)
(exit)