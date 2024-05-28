(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand (_ bv1 k) (bvshl (bvshl s t) (bvnot s))) (bvand (_ bv1 k) (bvshl s (bvnot (bvshl s t))))))
(check-sat)
(exit)