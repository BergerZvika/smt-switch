(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvand s t) (bvlshr (_ bv0 k) s)) (bvand s t)))
(check-sat)
(exit)