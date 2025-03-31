(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvor s (bvadd s (bvshl s s))) (bvadd s (bvshl s s))))
(check-sat)
(exit)