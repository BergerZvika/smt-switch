(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvadd s (bvneg (bvor s t))) (bvneg (bvand (bvneg s) t))))
(check-sat)
(exit)