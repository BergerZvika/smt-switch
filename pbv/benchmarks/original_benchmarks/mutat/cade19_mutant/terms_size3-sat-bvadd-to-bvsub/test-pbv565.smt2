(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvsub s (bvshl (bvneg t) s)) (bvadd s (bvneg (bvshl t s)))))
(check-sat)
(exit)