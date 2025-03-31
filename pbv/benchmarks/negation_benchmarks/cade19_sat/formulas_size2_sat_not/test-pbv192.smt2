(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvsle t (bvnot s)) (bvsle s (bvnot t)))))
(check-sat)
(exit)