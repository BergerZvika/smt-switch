(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr (bvmul s (bvadd s s)) s) (bvmul s (bvlshr (bvadd s s) s))))
(assert (>= k 4))
(check-sat)
(exit)