(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr (bvshl (_ bv1 k) s) (bvshl s (bvshl s s))) (bvand (bvshl (_ bv1 k) s) (bvnot (bvshl (_ bv1 k) (_ bv1 k))))))
(check-sat)
(exit)