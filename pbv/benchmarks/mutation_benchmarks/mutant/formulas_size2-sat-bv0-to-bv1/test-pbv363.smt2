(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvult (bvlshr (_ bv1 k) s) t) (bvult (bvlshr s s) t)))
(check-sat)
(exit)