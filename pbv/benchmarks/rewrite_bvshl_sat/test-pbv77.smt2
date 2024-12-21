(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvadd (bvshl s s) (bvshl t s)) (bvshl (bvadd s t) s))))
(check-sat)
(exit)