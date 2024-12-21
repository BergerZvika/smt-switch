(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand (_ bv1 k) (bvshl s (bvshl (bvshl (_ bv1 k) t) (_ bv1 k)))) (bvand s (bvshl (_ bv1 k) (bvshl (bvnot t) t)))))
(check-sat)
(exit)