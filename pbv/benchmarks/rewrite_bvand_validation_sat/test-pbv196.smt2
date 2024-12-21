(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvshl (bvshl (_ bv1 k) (bvand s t)) (bvnot t)) (bvshl (_ bv1 k) (bvnot (bvand t (bvnot s)))))))
(check-sat)
(exit)