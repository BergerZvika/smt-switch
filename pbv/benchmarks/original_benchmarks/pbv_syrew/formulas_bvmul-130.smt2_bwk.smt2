(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvule s (bvshl (bvmul s s) s)) (bvule s (bvmul s (bvshl s s)))))
(check-sat)
