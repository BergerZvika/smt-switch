(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvult s (bvadd t s)) (bvult s (bvnot t))))
(check-sat)
(exit)