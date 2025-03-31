(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvshl s t) s) (bvshl (bvshl s s) t)))
(check-sat)
(exit)