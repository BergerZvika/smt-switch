(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (not (distinct (bvmul s (bvshl (bvshl (_ bv1 k) t) t)) (bvshl (bvshl s t) t))))
(check-sat)
