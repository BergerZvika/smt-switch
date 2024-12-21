(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvsub s (bvlshr (bvshl t t) s)) (bvsub s (bvshl (bvshl t s) t))))
(check-sat)
(exit)