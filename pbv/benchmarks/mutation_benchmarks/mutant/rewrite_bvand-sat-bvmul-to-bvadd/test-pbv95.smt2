(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvadd s (bvand (_ bv1 k) (bvadd s (_ bv1 k)))) (bvsub s (bvmul s (bvand s (_ bv1 k))))))
(check-sat)
(exit)