(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvshl (bvand s (_ bv0 k)) s) (bvmul s (bvshl s s))))
(check-sat)