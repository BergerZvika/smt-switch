(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvult s (bvnot (bvurem (_ bv0 k) s))) (bvult s (bvnot (_ bv1 k)))))
(check-sat)
