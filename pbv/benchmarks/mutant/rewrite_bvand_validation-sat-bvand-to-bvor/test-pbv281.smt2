(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvor s (bvshl s (bvshl s s))) t) (bvshl (bvshl s t) (bvshl (bvnot (_ bv0 k)) s))))
(check-sat)
(exit)