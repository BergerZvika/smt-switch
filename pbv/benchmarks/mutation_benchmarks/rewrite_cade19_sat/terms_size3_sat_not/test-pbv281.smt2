(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvmul s (bvmul s (bvmul s s))) (bvand s (bvneg (bvnot (_ bv0 k)))))))
(check-sat)
(exit)