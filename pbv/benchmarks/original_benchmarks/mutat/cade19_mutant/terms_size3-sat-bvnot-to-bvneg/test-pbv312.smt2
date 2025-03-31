(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvadd s (bvor t (bvneg s))) (bvnot (bvneg (bvand s t)))))
(check-sat)
(exit)