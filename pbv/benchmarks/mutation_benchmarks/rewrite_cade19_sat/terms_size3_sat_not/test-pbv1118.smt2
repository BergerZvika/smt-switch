(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvadd t (bvor (bvlshr t t) s)) (bvadd s t))))
(check-sat)
(exit)