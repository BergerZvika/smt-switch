(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvor s (bvor (bvneg t) t)) (bvor s (bvor t (bvneg t))))))
(check-sat)
(exit)