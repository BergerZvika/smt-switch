(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvor s (bvneg (bvshl t s))) (bvsub s (bvneg (bvshl t s)))))
(check-sat)
(exit)