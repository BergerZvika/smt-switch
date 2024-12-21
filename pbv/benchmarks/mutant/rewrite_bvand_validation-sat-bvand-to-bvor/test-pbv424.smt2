(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvshl (_ bv1 k) (bvshl s (bvnot t))) t) (bvshl (bvor (_ bv1 k) (bvnot (bvshl s s))) t)))
(check-sat)
(exit)