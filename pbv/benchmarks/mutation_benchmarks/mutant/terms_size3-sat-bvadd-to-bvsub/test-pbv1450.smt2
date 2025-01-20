(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvshl s (bvlshr s t)) t) (bvshl s (bvsub t (bvlshr s t)))))
(check-sat)
(exit)