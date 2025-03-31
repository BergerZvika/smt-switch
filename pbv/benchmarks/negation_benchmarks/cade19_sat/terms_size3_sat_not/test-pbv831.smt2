(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvmul s (bvor (bvlshr t t) s)) (bvmul s s))))
(check-sat)
(exit)