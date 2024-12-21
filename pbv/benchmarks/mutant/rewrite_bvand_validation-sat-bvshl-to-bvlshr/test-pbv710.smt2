(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr s (bvand t (bvshl (_ bv1 k) (bvshl (_ bv1 k) t)))) (bvshl s (bvand t (bvshl (_ bv1 k) (bvshl t t))))))
(check-sat)
(exit)