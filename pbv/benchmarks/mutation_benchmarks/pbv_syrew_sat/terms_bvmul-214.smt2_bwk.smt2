(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (not (distinct (bvmul (bvshl s s) (bvand s t)) (bvmul s (bvshl (bvand s t) s)))))
(check-sat)
