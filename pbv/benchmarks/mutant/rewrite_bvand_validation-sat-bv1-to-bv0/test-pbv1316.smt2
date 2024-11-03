(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (_ bv0 k) (bvshl (bvnot s) (bvshl s (_ bv1 k)))) (bvand (_ bv1 k) (bvshl (_ bv1 k) (bvshl (_ bv1 k) (bvshl s (_ bv1 k)))))))
(check-sat)
(exit)