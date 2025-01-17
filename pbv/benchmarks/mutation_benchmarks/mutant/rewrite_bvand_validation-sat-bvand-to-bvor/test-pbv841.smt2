(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvor s (bvshl (_ bv1 k) (bvand t (bvshl (_ bv1 k) s)))) (bvand s (bvshl (_ bv1 k) (bvand t (bvshl s s))))))
(check-sat)
(exit)