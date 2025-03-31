(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvor t (bvor s (bvsub s s))) (bvor s (bvor t (bvadd s s)))))
(check-sat)
(exit)