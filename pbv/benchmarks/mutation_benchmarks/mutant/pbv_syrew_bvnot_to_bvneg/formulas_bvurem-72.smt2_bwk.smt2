(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (= s (bvneg (bvurem (_ bv1 k) s))) (= s (bvnot (_ bv1 k)))))
(check-sat)
