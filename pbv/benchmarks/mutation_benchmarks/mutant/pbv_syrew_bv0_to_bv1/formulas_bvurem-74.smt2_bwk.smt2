(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvule s (bvnot (bvurem (_ bv1 k) s))) (distinct s (bvnot (_ bv1 k)))))
(check-sat)
