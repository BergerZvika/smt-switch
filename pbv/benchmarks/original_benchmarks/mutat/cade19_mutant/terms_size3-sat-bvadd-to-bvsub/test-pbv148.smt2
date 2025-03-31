(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvshl s s) s) (bvshl (bvsub s s) s)))
(check-sat)
(exit)