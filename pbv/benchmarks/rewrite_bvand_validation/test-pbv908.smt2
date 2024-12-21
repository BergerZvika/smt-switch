(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl s (bvshl (bvnot (_ bv0 k)) (bvshl s t))) (bvand s (bvshl s (bvshl s (bvshl s t))))))
(check-sat)
(exit)