(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (= s (bvurem s (bvneg (_ bv1 k)))) (bvult s (bvnot (_ bv1 k)))))
(check-sat)