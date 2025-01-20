(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvadd t (bvmul t (bvshl s s))) (bvmul s (bvmul t (bvshl t s)))))
(check-sat)