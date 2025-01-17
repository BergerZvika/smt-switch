(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvshl s (bvshl t (_ bv1 k))) (bvshl t (_ bv1 k))) (bvshl s (bvshl t (bvshl (_ bv1 k) (bvand t (_ bv1 k)))))))
(check-sat)
(exit)