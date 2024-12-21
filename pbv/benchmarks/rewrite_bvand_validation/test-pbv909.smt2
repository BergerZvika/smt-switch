(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand s (bvshl (bvnot (_ bv0 k)) (bvshl t s))) (bvand s (bvshl s (bvshl t s)))))
(check-sat)
(exit)