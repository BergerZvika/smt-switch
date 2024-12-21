(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvshl (bvshl s (bvadd s s)) t) (bvshl (bvshl s t) (bvadd s s)))))
(check-sat)
(exit)