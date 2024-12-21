(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvshl (_ bv1 k) (bvor t (bvshl (_ bv1 k) t))) t) (bvshl (bvand (_ bv1 k) (bvnot (bvshl s s))) t)))
(check-sat)
(exit)