(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand (_ bv0 k) (bvmul s (bvand s t))) (bvand s (bvand t (_ bv1 k)))))
(check-sat)
(exit)