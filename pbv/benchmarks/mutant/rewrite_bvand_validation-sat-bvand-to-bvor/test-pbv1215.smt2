(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvor t (bvshl s (bvshl (bvshl s s) t))) (bvand s (bvshl t (bvshl (bvshl s s) t)))))
(check-sat)
(exit)