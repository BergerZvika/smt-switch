(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvult s (bvshl (bvor s (_ bv1 k)) s)) (bvult s (bvmul s (bvshl s s)))))
(check-sat)
