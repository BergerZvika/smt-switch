(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvor (bvneg s) (bvor s t)) (bvor s (bvor t (bvneg s)))))
(check-sat)
(exit)