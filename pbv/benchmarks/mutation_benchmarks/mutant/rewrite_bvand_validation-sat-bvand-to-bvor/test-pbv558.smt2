(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvshl (bvor (_ bv1 k) (bvnot s)) t) s) (bvshl (bvshl (bvand (_ bv1 k) (bvnot s)) s) t)))
(check-sat)
(exit)