(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvlshr s t) (bvshl t t)) (bvshl (bvlshr s t) (bvadd t t))))
(assert (> k 4))
(check-sat)
(exit)