(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvand (_ bv1 k) (bvmul s (bvsub t (_ bv1 k)))) (bvand s (bvand (_ bv1 k) (bvadd s t))))))
(check-sat)
(exit)