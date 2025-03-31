(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvadd (bvneg s) (bvor s t)) (bvadd t (bvnot (bvand s t)))))
(check-sat)
(exit)