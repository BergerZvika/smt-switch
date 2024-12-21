(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvand s (bvand (_ bv1 k) (bvshl t (bvshl s s)))) (bvand s (bvand t (bvshl (_ bv1 k) (bvshl s s)))))))
(check-sat)
(exit)