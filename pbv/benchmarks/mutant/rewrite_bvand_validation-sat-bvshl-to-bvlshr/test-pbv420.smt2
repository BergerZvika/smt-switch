(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr (bvand (_ bv1 k) (bvshl s (bvnot s))) (_ bv1 k)) (bvand (bvshl (_ bv1 k) (_ bv1 k)) (bvshl s (bvnot s)))))
(check-sat)
(exit)