(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvshl (bvshl s s) (bvor s t)) (bvshl (bvadd s s) (bvor s t)))))
(check-sat)
(exit)