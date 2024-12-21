(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvshl s (bvlshr t (bvshl t t))) (bvlshr s (bvlshr t (bvshl t t))))))
(check-sat)
(exit)