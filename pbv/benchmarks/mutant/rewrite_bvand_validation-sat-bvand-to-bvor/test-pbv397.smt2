(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvor t (bvshl s (bvand s t))) s) (bvshl s (bvshl (bvnot (bvshl t s)) (_ bv1 k)))))
(check-sat)
(exit)