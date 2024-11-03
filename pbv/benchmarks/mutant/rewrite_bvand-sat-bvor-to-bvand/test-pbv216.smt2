(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand (_ bv1 k) (bvmul s (bvsub s (_ bv1 k)))) (bvsub (_ bv1 k) (bvsub s (bvmul s s)))))
(check-sat)
(exit)