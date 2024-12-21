(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvor (bvshl s s) (bvshl (bvand t (_ bv1 k)) (_ bv1 k))) (bvand (bvshl s s) (bvshl s (bvand t (_ bv1 k))))))
(check-sat)
(exit)