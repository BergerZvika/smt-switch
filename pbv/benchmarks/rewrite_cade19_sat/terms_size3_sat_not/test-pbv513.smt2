(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvand s (bvor t (bvmul t (_ bv0 k)))) (bvand s t))))
(check-sat)
(exit)