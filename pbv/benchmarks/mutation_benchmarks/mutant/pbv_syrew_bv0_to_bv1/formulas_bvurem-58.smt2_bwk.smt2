(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvule s (bvnot (bvurem s (_ bv1 k)))) (bvult s (bvnot s))))
(check-sat)
