(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvult s (bvsub s t)) (bvult s (bvneg t))))
(check-sat)
(exit)