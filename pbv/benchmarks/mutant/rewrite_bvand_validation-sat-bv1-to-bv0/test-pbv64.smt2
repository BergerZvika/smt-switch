(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand (bvshl (_ bv0 k) s) (bvshl t (bvshl s t))) (bvand t (bvshl (bvshl (_ bv1 k) s) (bvshl s t)))))
(check-sat)
(exit)