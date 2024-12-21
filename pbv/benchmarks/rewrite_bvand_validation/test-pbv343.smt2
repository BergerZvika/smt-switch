(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvshl s (bvand (_ bv1 k) (bvnot t))) t) (bvshl (bvshl s t) (bvand (_ bv1 k) (bvnot t)))))
(check-sat)
(exit)