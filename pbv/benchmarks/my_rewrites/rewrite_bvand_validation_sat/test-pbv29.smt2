(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvand (bvshl s (_ bv1 k)) (bvshl (bvshl (_ bv1 k) t) t)) (bvshl (bvand s (bvshl t t)) t))))
(check-sat)
(exit)