(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvshl (bvor s (_ bv1 k)) s) (bvmul s (bvshl s s))))
(check-sat)