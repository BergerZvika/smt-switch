(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand (_ bv1 k) (bvshl (bvshl t s) (bvshl s (_ bv1 k)))) (bvand (_ bv1 k) (bvand (bvnot s) (bvshl t s)))))
(check-sat)
(exit)