(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl s (bvshl (bvneg t) t)) (bvshl s (bvneg (bvshl t t)))))
(check-sat)
(exit)