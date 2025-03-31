(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvshl (bvsub s t) t) s) (bvshl (bvshl (bvadd s t) s) t)))
(check-sat)
(exit)