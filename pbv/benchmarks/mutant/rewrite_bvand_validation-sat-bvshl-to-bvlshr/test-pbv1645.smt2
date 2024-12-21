(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr (bvand s (bvshl (_ bv1 k) (_ bv1 k))) s) (bvshl (bvand s (bvnot (_ bv1 k))) s)))
(check-sat)
(exit)