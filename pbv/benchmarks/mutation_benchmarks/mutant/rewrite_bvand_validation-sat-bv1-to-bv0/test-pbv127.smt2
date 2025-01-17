(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvand s (bvnot (_ bv0 k))) (bvshl t s)) (bvand s (bvshl (bvnot (_ bv1 k)) (bvshl t s)))))
(check-sat)
(exit)