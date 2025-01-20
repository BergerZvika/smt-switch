(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvadd t (bvshl s (bvshl s t))) (bvmul s (bvshl t (bvshl s t)))))
(check-sat)
