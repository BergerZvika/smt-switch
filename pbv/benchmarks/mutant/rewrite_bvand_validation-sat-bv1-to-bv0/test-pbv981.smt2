(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl s (bvshl (bvand t (_ bv0 k)) (bvand t (_ bv1 k)))) (bvshl s (bvshl (bvand t (_ bv1 k)) (_ bv1 k)))))
(check-sat)
(exit)