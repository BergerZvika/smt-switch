(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand t (bvneg (bvneg s))) (bvadd s (bvor t (bvneg s)))))
(check-sat)
(exit)