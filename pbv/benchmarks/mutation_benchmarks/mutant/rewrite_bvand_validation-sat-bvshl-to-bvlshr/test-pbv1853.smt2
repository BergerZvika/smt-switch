(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr (bvand s t) (bvshl (bvshl (_ bv1 k) t) (_ bv1 k))) (bvand s (bvshl t (bvshl (bvnot t) t)))))
(check-sat)
(exit)