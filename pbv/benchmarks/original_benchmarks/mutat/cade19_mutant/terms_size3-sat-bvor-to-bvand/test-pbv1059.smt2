(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvadd t (bvadd s (bvand s t))) (bvadd s (bvadd t (bvor s t)))))
(check-sat)
(exit)