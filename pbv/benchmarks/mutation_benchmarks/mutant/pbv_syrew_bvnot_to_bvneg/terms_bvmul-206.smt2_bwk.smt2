(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvmul (bvneg s) (bvshl s t)) (bvmul s (bvshl (bvnot s) t))))
(check-sat)
