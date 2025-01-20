(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvadd t (bvshl (bvmul s s) (_ bv1 k))) (bvmul s (bvmul s (bvshl t (_ bv1 k))))))
(check-sat)
