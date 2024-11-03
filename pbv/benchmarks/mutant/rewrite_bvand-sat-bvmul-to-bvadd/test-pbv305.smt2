(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvadd (bvand s t) (bvand t (_ bv1 k))) (bvand s (bvmul t (bvand t (_ bv1 k))))))
(check-sat)
(exit)