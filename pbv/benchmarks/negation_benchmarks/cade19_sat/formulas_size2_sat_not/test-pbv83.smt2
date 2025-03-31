(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvult s (bvadd t s)) (bvult s (bvneg t)))))
(check-sat)
(exit)