(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvor (bvnot t) (bvor s t)) (bvor s (bvor t (bvneg t)))))
(check-sat)
(exit)