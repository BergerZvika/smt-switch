(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvult t (bvnot s)) (bvult s (bvnot t))))
(check-sat)
(exit)