(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvshl (bvand s (bvshl t (bvshl (_ bv1 k) (_ bv1 k)))) t) (bvshl (bvand s (bvshl t (bvshl t t))) t))))
(check-sat)
(exit)