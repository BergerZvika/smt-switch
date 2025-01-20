(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr (bvand (bvshl t s) (bvshl (_ bv1 k) t)) s) (bvshl (bvand (bvnot s) (bvshl s t)) s)))
(check-sat)
(exit)