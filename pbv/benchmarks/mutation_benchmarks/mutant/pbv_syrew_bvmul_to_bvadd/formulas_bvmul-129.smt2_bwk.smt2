(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvult s (bvshl (bvadd s s) s)) (bvult s (bvmul s (bvshl s s)))))
(check-sat)
