(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand s (bvand t (bvlshr (_ bv1 k) (bvnot t)))) (bvand s (bvshl (_ bv1 k) (bvnot t)))))
(check-sat)
(exit)