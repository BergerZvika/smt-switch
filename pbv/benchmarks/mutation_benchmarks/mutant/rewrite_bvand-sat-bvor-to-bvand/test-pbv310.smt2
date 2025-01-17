(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand (bvand s t) (bvor s (_ bv1 k))) (bvor s (bvand t (_ bv1 k)))))
(check-sat)
(exit)