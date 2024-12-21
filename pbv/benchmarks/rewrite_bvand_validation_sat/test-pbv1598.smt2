(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvshl (bvand (_ bv1 k) (bvlshr s t)) t) (bvand s (bvshl (_ bv1 k) t)))))
(check-sat)
(exit)