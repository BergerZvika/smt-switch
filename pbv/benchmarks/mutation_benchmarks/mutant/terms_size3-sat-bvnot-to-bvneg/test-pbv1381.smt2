(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvneg (bvshl s s)) s) (bvshl (bvnot (bvadd s s)) s)))
(check-sat)
(exit)