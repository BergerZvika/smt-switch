(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvsle (bvnot s) s) (bvule s (bvneg s))))
(check-sat)
(exit)