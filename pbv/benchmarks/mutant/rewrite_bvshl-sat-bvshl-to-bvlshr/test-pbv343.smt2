(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (= s (bvlshr (bvshl s t) s)) (= s (_ bv0 k))))
(check-sat)
(exit)