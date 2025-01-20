(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvmul s (bvshl (bvadd t (_ bv1 k)) t)) (bvmul s (bvmul t (bvshl t t)))))
(check-sat)
