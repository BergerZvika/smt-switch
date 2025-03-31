(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvmul s (bvadd (bvshl t s) t)) (bvmul s (bvadd t (bvlshr t s)))))
(check-sat)
(exit)