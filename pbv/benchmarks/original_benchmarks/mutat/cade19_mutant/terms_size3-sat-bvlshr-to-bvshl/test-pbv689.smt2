(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl s (bvmul (bvshl t s) t)) (bvshl s (bvmul t (bvlshr t s)))))
(check-sat)
(exit)