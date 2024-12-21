(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvsub (bvand s t) (bvadd s (_ bv1 k))) (bvor t (bvsub (_ bv0 k) (bvadd s (_ bv1 k)))))))
(check-sat)
(exit)