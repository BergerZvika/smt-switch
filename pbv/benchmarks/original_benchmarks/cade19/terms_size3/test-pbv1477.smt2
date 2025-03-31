(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvlshr s (bvshl t s)) t) (bvlshr (bvshl s t) (bvshl t s))))
(check-sat)
(exit)