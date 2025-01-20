(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvmul t (bvmul t (bvsub s s))) (bvmul s (bvmul t (bvshl t s)))))
(check-sat)
