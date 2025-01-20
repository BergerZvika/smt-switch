(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvmul (bvadd s t) (bvshl s t)) (bvmul s (bvshl (bvand s t) t))))
(check-sat)
