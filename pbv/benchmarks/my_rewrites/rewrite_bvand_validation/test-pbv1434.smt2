(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr (_ bv1 k) (bvand t (bvshl s s))) (bvlshr (_ bv1 k) (bvand s (bvlshr t s)))))
(check-sat)
(exit)