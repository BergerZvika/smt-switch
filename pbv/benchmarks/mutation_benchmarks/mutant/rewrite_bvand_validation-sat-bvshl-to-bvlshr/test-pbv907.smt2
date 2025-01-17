(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr s (bvshl (bvnot (_ bv0 k)) (bvand s t))) (bvand s (bvshl s (bvshl s (bvand s t))))))
(check-sat)
(exit)