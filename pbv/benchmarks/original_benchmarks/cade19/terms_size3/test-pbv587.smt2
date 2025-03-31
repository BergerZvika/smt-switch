(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvadd s (bvor (bvneg t) t)) (bvadd s (bvor t (bvneg t)))))
(check-sat)
(exit)