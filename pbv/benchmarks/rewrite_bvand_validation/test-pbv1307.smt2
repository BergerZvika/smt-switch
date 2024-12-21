(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand (_ bv1 k) (bvshl (_ bv1 k) (bvand s (bvand t (_ bv1 k))))) (bvand (_ bv1 k) (bvnot (bvand s t)))))
(check-sat)
(exit)