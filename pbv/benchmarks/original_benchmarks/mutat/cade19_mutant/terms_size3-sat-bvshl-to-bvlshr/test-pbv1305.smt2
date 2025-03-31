(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvmul (bvand s t) (bvlshr t s)) (bvmul t (bvshl (bvand s t) s))))
(check-sat)
(exit)