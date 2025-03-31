(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand (bvadd s t) (bvor s t)) (bvor s (bvor t (bvadd s t)))))
(check-sat)
(exit)