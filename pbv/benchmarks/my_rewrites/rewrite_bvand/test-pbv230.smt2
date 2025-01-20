(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvor (_ bv1 k) (bvand s (bvor t (_ bv1 k)))) (bvor (_ bv1 k) (bvand s t))))
(check-sat)
(exit)