(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvlshr (bvshl s s) t) s) (bvlshr (bvshl s (bvlshr s t)) s)))
(check-sat)
(exit)