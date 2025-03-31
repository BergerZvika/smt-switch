(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvor s (bvshl (bvshl s s) t)) (bvsub s (bvshl (bvshl s s) t))))
(check-sat)
(exit)