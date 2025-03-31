(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvadd (bvneg t) (bvor s t)) (bvadd s (bvnot (bvand s t)))))
(check-sat)
(exit)