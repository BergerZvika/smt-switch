(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand (bvlshr s s) (bvlshr t (_ bv1 k))) (bvand (bvadd s s) (bvlshr t s))))
(check-sat)
(exit)