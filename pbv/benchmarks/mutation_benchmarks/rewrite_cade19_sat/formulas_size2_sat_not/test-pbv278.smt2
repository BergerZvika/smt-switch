(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvsle (bvand s t) t) (bvsle s (bvor s t)))))
(check-sat)
(exit)