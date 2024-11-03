(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand s (bvadd (bvor t (_ bv1 k)) t)) (bvand s (bvand (_ bv1 k) (bvadd s t)))))
(check-sat)
(exit)