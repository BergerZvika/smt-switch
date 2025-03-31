(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (= t (bvnot s)) (= s (bvneg t))))
(check-sat)
(exit)