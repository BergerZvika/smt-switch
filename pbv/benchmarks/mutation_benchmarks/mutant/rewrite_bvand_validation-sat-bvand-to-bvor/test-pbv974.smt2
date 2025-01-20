(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvor s (bvshl (bvshl t t) (bvshl (_ bv1 k) (_ bv1 k)))) (bvand s (bvshl (bvshl t t) (bvshl t t)))))
(check-sat)
(exit)