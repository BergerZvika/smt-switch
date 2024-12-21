(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand s (bvshl (_ bv1 k) (bvshl (bvshl t (_ bv1 k)) t))) (bvand s (bvshl (_ bv1 k) (bvshl (bvshl t t) t)))))
(check-sat)
(exit)