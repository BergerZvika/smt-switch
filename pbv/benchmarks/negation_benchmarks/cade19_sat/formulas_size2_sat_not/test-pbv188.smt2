(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (= t (bvnot s)) (= s (bvnot t)))))
(check-sat)
(exit)