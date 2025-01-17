(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvor (bvshl s t) (bvnot (bvand s (_ bv1 k)))) (bvand (bvnot (_ bv1 k)) (bvshl s t))))
(check-sat)
(exit)