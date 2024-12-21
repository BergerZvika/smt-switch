(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl s (bvand (_ bv1 k) (bvshl (bvnot (_ bv0 k)) t))) (bvshl s (bvand (_ bv1 k) (bvshl (_ bv1 k) t)))))
(check-sat)
(exit)