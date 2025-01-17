(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvand s (_ bv0 k)) (bvshl t (bvnot t))) (bvand s (bvshl (_ bv1 k) (bvshl t (bvnot t))))))
(check-sat)
(exit)