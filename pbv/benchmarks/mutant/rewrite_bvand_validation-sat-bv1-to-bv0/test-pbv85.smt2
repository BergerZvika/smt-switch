(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand (bvshl (_ bv0 k) s) (bvshl (bvand t (_ bv1 k)) s)) (bvand (bvnot s) (bvshl (bvand t (_ bv1 k)) s))))
(check-sat)
(exit)