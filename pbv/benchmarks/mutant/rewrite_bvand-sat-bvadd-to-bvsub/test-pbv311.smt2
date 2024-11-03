(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvsub (bvor s t) (bvsub s (_ bv1 k))) (bvsub t (bvadd (_ bv1 k) (bvand s t)))))
(check-sat)
(exit)