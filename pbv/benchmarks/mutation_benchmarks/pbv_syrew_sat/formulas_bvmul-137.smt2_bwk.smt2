(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (not (distinct (bvult s (bvshl (bvmul s s) t)) (bvult s (bvmul s (bvshl s t))))))
(check-sat)
