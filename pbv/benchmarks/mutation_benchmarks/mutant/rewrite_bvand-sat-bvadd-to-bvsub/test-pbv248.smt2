(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand (_ bv1 k) (bvor t (bvand s t))) (bvand (_ bv1 k) (bvsub s (bvadd s t)))))
(check-sat)
(exit)