(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr (bvshl (bvand s (bvshl (_ bv1 k) (_ bv1 k))) t) s) (bvshl (bvand s (bvshl (bvnot (_ bv1 k)) t)) s)))
(check-sat)
(exit)