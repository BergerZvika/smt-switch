(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand (bvnot (_ bv1 k)) (bvlshr (bvshl s (_ bv1 k)) t)) (bvshl (bvshl s t) (_ bv1 k))))
(check-sat)
(exit)