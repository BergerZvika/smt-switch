(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvadd t (bvneg (bvand s t))) (bvand (bvneg s) t)))
(check-sat)
(exit)