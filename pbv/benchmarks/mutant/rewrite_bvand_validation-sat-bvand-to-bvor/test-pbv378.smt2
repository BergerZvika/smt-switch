(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvor s (bvshl t (bvshl (_ bv1 k) t))) (bvand s (bvshl t (bvshl t t)))))
(check-sat)
(exit)