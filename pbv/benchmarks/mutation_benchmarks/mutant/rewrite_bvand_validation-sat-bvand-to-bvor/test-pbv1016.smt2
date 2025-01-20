(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl s (bvshl (bvnot (bvor t (_ bv1 k))) s)) (bvshl s (bvshl (bvnot (bvand s t)) s))))
(check-sat)
(exit)