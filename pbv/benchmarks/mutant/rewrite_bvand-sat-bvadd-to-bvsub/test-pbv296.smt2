(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvsub (bvand s t) (bvsub s s)) (bvsub t (bvadd s (bvor s t)))))
(check-sat)
(exit)