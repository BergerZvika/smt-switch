(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (not (distinct (bvule s (bvshl (bvmul s s) t)) (bvule s (bvmul s (bvshl s t))))))
(check-sat)