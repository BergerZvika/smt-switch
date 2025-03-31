(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr (bvshl s (bvshl t t)) t) (bvlshr (bvshl s (bvsub t t)) t)))
(check-sat)
(exit)