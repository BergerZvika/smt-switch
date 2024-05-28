(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvand s (bvnot (_ bv1 k))) (bvshl s (_ bv1 k))) (bvand s (bvshl s (bvshl s (_ bv1 k))))))
(check-sat)
(exit)