(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvshl (_ bv1 k) s) (bvnot (bvand s t))) (_ bv1 k)))
(check-sat)
(exit)