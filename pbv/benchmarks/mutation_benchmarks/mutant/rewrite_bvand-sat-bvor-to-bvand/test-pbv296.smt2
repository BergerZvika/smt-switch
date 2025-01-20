(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvsub (bvand s t) (bvadd s s)) (bvsub t (bvadd s (bvand s t)))))
(check-sat)
(exit)