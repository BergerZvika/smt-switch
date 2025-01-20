(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvnot (bvor s (_ bv1 k))) (bvand s (_ bv1 k))) (bvshl (bvnot (_ bv0 k)) (bvshl (bvand s (_ bv1 k)) (_ bv1 k)))))
(check-sat)
(exit)