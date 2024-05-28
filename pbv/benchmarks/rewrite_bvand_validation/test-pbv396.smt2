(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvand t (bvshl s (bvshl s s))) t) (bvshl (bvand s (bvshl t (bvshl s s))) t)))
(check-sat)
(exit)