(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvule s (bvsub s t)) (bvule s (bvnot t))))
(check-sat)
(exit)