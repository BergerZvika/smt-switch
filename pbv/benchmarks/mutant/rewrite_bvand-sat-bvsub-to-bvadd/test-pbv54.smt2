(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvadd s (bvsub t (bvor s t))) (bvadd s (bvsub s (bvand s t)))))
(check-sat)
(exit)