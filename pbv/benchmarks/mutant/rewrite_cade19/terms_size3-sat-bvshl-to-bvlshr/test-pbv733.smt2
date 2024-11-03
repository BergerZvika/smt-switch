(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr s (bvand (bvlshr t s) t)) (bvlshr s (bvand t (bvshl t s)))))
(check-sat)
(exit)