(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvor (_ bv1 k) (bvadd s (bvlshr (_ bv1 k) t))) (bvand (_ bv1 k) (bvadd s (bvshl (_ bv1 k) t)))))
(check-sat)
(exit)