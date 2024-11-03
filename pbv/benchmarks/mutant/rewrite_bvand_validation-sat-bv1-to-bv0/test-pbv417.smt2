(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvand (_ bv0 k) (bvnot (bvshl s t))) t) (bvand (bvshl (_ bv1 k) t) (bvnot (bvand s (_ bv1 k))))))
(check-sat)
(exit)