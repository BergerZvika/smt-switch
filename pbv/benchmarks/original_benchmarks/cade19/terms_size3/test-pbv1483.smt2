(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvand s (bvmul t t)) s) (bvmul s (bvshl (bvand s t) s))))
(check-sat)
(exit)