(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvslt t (bvnot s)) (bvslt s (bvnot t))))
(check-sat)
(exit)