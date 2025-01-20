(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand (_ bv0 k) (bvshl (bvlshr (_ bv1 k) s) t)) (bvlshr (bvlshr (_ bv1 k) s) t)))
(check-sat)
(exit)