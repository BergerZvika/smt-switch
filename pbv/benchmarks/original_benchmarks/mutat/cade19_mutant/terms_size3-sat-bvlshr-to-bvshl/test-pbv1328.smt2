(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvmul (bvshl s t) (bvshl t s)) (bvmul t (bvshl (bvlshr s t) s))))
(check-sat)
(exit)