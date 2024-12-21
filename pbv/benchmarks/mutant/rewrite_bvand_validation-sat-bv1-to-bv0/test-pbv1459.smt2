(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand (_ bv0 k) (bvshl (bvshl s t) t)) (bvand s (bvlshr (_ bv1 k) t))))
(check-sat)
(exit)