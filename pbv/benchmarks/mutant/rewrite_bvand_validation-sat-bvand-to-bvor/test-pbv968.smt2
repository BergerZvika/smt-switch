(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvor s (bvand (bvshl t t) (bvshl (_ bv1 k) t))) (bvand s (bvshl (bvand t (_ bv1 k)) t))))
(check-sat)
(exit)