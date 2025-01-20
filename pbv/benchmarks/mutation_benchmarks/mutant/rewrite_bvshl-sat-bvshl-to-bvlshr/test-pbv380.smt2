(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvult s (bvlshr (bvadd t t) s)) (bvult s (bvshl t (bvadd s (_ bv1 k))))))
(check-sat)
(exit)