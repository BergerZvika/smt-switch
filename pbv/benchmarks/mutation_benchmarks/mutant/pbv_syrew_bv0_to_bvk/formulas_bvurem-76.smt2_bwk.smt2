(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (= s (bvurem s (bvnot (_ bvk k)))) (distinct s (bvnot (_ bv0 k)))))
(check-sat)
