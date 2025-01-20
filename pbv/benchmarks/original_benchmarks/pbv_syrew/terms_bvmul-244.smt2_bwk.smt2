(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvmul (bvand s t) (bvshl t s)) (bvmul t (bvshl (bvand s t) s))))
(check-sat)
