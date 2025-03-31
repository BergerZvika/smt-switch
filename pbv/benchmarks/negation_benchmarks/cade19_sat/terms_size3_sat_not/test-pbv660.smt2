(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvadd s (bvshl (bvadd s s) s)) (bvor s (bvshl s (bvshl s s))))))
(check-sat)
(exit)