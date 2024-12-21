(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvor s (bvshl (bvnot (bvshl (_ bv1 k) s)) t)) (bvand s (bvshl (bvnot (_ bv0 k)) t))))
(check-sat)
(exit)