(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand (bvshl (_ bv1 k) s) (bvshl (bvand s (_ bv1 k)) t)) (bvand (bvshl s s) (bvshl (bvand s (_ bv1 k)) t))))
(check-sat)
(exit)