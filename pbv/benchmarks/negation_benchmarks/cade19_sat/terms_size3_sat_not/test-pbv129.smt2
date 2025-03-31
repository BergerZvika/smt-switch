(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvadd t (bvadd s s)) (bvadd s (bvadd s t)))))
(check-sat)
(exit)