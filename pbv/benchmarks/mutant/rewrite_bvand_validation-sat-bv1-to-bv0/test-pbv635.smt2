(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvshl (bvlshr s (_ bv0 k)) t) (_ bv1 k)) (bvshl (bvand s (bvnot (_ bv1 k))) t)))
(check-sat)
(exit)