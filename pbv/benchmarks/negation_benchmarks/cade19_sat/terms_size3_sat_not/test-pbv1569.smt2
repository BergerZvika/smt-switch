(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvlshr (bvshl (bvshl s t) t) s) (bvlshr (bvshl s (bvshl t t)) s))))
(check-sat)
(exit)