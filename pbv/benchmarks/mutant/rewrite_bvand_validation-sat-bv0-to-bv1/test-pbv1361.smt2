(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand s (bvlshr (bvnot (_ bv1 k)) t)) (bvlshr (bvshl s t) t)))
(check-sat)
(exit)