(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl s (bvshl (bvshl t s) s)) (bvshl s (bvshl (bvshl t s) s))))
(check-sat)
(exit)