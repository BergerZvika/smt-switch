(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand (bvshl (_ bv1 k) s) (bvshl (bvshl t s) s)) (bvand (_ bv1 k) (bvand (bvnot s) (bvshl t s)))))
(check-sat)
(exit)