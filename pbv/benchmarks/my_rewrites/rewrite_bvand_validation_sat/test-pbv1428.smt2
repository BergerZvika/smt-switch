(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvlshr (_ bv1 k) (bvand s (bvshl (_ bv1 k) t))) (bvand (_ bv1 k) (bvnot (bvlshr s t))))))
(check-sat)
(exit)