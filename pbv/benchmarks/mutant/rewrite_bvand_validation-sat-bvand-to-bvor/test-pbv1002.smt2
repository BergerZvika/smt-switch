(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl s (bvor (bvshl (_ bv1 k) t) (bvshl (_ bv1 k) (_ bv1 k)))) (bvshl s (bvand (bvshl t t) (bvshl t (_ bv1 k))))))
(check-sat)
(exit)