(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr (bvshl s s) (bvmul s s)) (bvand s (bvlshr (bvsub s s) s))))
(check-sat)
(exit)