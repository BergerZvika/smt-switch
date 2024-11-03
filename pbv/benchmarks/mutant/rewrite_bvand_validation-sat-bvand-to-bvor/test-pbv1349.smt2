(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl s (bvor (_ bv1 k) (bvshl (_ bv1 k) t))) (bvshl s (bvlshr (_ bv1 k) t))))
(check-sat)
(exit)