(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvurem s (bvlshr (_ bv1 k) (bvneg s))) (bvurem s (bvnot (_ bv0 k)))))
(check-sat)