(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvadd (bvadd s t) (bvlshr t s)) (bvadd s (bvadd t (bvlshr t s))))))
(check-sat)
(exit)