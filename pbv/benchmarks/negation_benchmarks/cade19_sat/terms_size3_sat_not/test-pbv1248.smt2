(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvor (bvadd s t) (bvor s t)) (bvor s (bvor t (bvadd s t))))))
(check-sat)
(exit)