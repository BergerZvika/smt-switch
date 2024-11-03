(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr s (bvand (bvshl t s) (bvshl (_ bv1 k) s))) (bvshl s (bvshl (bvand t (_ bv1 k)) s))))
(check-sat)
(exit)