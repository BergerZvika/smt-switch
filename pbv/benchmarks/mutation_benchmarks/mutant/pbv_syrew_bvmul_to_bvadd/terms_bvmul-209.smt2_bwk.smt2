(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvadd (bvnot (_ bv0 k)) (bvshl s (_ bv1 k))) (bvmul s (bvnot (_ bv1 k)))))
(check-sat)
