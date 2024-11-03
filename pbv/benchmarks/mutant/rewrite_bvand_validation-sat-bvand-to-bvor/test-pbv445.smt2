(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvshl (bvnot s) (bvor s t)) t) (bvshl (bvshl (bvnot s) t) (bvand s t))))
(check-sat)
(exit)