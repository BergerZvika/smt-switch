(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvand (_ bv1 k) (bvnot s)) (bvshl s s)) (bvand (_ bv1 k) (bvshl (bvnot s) (bvshl s s)))))
(check-sat)
(exit)