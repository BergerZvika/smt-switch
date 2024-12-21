(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvshl s (_ bv1 k)) (bvand t (bvnot (_ bv1 k)))) (bvshl (bvshl s t) (bvand (_ bv1 k) (bvnot t)))))
(check-sat)
(exit)