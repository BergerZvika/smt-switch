(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvnot (bvshl (bvor s t) (_ bv1 k))) s) (bvshl (bvnot (bvshl (bvand s t) s)) s)))
(check-sat)
(exit)