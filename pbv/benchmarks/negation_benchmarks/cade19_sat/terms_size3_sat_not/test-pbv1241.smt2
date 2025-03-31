(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvadd (bvadd s t) (bvadd s t)) (bvadd s (bvadd s (bvadd t t))))))
(check-sat)
(exit)