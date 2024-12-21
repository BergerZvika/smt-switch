(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand t (bvand (_ bv0 k) (bvshl s (bvshl t s)))) (bvand s (bvand t (bvshl (_ bv1 k) (bvshl s s))))))
(check-sat)
(exit)