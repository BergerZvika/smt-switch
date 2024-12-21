(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvand (_ bv0 k) (bvshl (_ bv1 k) s)) (bvand s t)) (bvand (_ bv1 k) (bvshl (_ bv1 k) s))))
(check-sat)
(exit)