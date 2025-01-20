(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvmul (bvsub s s) (bvshl s t)) (bvmul s (bvshl (bvshl s s) t))))
(check-sat)