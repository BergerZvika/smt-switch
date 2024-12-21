(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvand (bvshl (_ bv1 k) (_ bv1 k)) (bvshl (bvnot (_ bv1 k)) s)) (bvshl (bvand (_ bv1 k) (bvshl (_ bv1 k) s)) (_ bv1 k)))))
(check-sat)
(exit)