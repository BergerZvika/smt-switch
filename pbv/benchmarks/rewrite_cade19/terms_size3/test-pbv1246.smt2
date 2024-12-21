(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvadd (bvadd s t) (bvlshr s t)) (bvadd s (bvadd t (bvlshr s t)))))
(check-sat)
(exit)