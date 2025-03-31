(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvshl s s) (bvsub s s)) (bvshl s (bvor s (bvadd s s)))))
(check-sat)
(exit)