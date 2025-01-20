(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvnot (bvor t (bvshl (_ bv1 k) t))) t) (bvshl (bvnot (bvshl s (bvnot t))) t)))
(check-sat)
(exit)