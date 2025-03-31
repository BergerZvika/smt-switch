(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvor s (bvmul t (bvlshr t s))) (bvadd s (bvmul t (bvshl t s)))))
(check-sat)
(exit)