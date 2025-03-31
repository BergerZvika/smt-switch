(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvadd s (bvmul (bvshl t s) t)) (bvadd s (bvmul t (bvlshr t s)))))
(check-sat)
(exit)