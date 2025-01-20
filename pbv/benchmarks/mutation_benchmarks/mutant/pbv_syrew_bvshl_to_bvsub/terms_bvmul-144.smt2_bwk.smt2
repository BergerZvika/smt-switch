(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvmul s (bvsub (bvshl (_ bv1 k) t) t)) (bvshl (bvshl s t) t)))
(check-sat)
