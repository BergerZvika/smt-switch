(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand (bvmul s s) (bvadd s (_ bv1 k))) (bvand (bvmul s s) (bvadd s (_ bv1 k)))))
(check-sat)
(exit)