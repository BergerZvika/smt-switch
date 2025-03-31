(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvadd t (bvshl (bvlshr t s) t)) (bvadd (bvlshr s s) t)))
(check-sat)
(exit)