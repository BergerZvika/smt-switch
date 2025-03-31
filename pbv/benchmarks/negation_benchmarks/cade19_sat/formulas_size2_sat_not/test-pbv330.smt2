(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvult (bvmul t s) s) (bvult (bvmul s t) s))))
(check-sat)
(exit)