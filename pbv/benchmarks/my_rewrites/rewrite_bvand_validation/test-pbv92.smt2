(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvshl (_ bv1 k) t) (bvand s (bvnot t))) (bvshl (bvshl (_ bv1 k) s) (bvand t (bvnot s)))))
(check-sat)
(exit)