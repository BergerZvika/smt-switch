(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvule s (bvadd t s)) (bvule s (bvnot t)))))
(check-sat)
(exit)