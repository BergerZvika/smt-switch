(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr (bvshl s t) (bvshl t t)) (bvshl s (bvor t (bvadd t t)))))
(check-sat)
(exit)