(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvshl s s) (bvshl t s)) (bvshl s (bvsub s (bvshl t s)))))
(check-sat)
(exit)