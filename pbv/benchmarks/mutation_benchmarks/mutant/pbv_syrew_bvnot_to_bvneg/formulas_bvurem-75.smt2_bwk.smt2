(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (distinct s (bvurem s (bvneg (_ bv0 k)))) (= s (bvnot (_ bv0 k)))))
(check-sat)
