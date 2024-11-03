(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvor s (bvshl (bvshl (bvnot s) t) t)) (bvand s (bvshl (bvnot s) (bvshl t t)))))
(check-sat)
(exit)