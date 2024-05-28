(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand (bvmul s t) (bvor s (_ bv1 k))) (bvand s (bvmul s t))))
(check-sat)
(exit)