(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl s (bvshl (bvor t (bvshl s (_ bv1 k))) s)) (bvshl s (bvshl (bvand t (bvshl s s)) s))))
(check-sat)
(exit)