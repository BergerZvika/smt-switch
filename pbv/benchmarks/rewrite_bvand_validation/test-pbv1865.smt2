(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand (bvshl s t) (bvshl s (bvshl t (_ bv1 k)))) (bvshl (bvand s (bvshl s t)) t)))
(check-sat)
(exit)