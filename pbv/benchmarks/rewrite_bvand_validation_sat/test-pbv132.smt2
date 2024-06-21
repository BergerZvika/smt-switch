(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvshl (bvand s (bvshl s t)) (bvshl t s)) (bvand s (bvshl (bvshl s t) (bvshl t s))))))
(check-sat)
(exit)