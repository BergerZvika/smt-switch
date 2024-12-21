(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvor (bvsub s t) (bvand t (_ bv1 k))) (bvor (bvadd s t) (bvand s (_ bv1 k)))))
(check-sat)
(exit)