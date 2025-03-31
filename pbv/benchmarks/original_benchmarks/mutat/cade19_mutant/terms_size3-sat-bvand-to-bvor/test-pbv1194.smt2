(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvadd (bvnot t) (bvor s t)) (bvadd s (bvnot (bvor s t)))))
(check-sat)
(exit)