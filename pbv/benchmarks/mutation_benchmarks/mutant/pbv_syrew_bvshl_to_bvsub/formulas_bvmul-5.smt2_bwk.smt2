(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (distinct s (bvmul s (bvnot (_ bv0 k)))) (distinct (_ bv0 k) (bvsub s (_ bv1 k)))))
(check-sat)
