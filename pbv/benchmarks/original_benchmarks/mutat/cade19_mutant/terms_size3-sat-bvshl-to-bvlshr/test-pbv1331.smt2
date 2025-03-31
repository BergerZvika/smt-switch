(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvor (bvlshr s t) (bvlshr t s)) (bvadd (bvlshr s t) (bvshl t s))))
(check-sat)
(exit)