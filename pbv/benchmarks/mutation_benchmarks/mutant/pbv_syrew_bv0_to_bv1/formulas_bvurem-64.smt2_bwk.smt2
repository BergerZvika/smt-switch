(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (= s (bvnot (bvurem (_ bv1 k) s))) (= s (bvnot (_ bv0 k)))))
(check-sat)
