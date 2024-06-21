(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvand s (bvshl (_ bv1 k) (bvshl (bvshl t (_ bv1 k)) s))) (bvand s (bvshl (_ bv1 k) (bvshl (bvshl t s) s))))))
(check-sat)
(exit)