(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvnot (bvor (_ bv1 k) (bvshl t t))) t) (bvshl (bvnot (bvshl s (bvnot t))) t)))
(check-sat)
(exit)