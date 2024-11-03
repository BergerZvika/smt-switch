(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (_ bv0 k) (bvshl (bvshl (bvnot (_ bv0 k)) s) t)) (bvand (_ bv1 k) (bvshl (_ bv1 k) (bvshl (bvshl (_ bv1 k) s) t)))))
(check-sat)
(exit)