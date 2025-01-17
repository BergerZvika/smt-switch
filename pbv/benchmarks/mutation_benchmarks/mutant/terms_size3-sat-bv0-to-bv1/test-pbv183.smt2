(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr (bvshl t (_ bv1 k)) (_ bv0 k)) (bvadd (bvlshr s s) t)))
(check-sat)
(exit)