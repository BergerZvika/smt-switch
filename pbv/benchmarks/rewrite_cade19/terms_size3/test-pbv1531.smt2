(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvshl (bvadd s s) t) s) (bvshl (bvshl (bvadd s s) s) t)))
(check-sat)
(exit)