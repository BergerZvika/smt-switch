(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvor (_ bv1 k) (bvshl s (bvshl t t))) s) (bvshl (bvand s (bvshl (_ bv1 k) (bvshl t t))) s)))
(check-sat)
(exit)