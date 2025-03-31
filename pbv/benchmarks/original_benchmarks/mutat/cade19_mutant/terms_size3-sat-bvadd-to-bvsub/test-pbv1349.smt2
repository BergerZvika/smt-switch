(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvor (bvor s t) (bvsub t t)) (bvor s (bvor t (bvadd t t)))))
(check-sat)
(exit)