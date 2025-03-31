(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvsub t (bvadd s (bvor s t))) (bvadd s (bvadd t (bvor s t)))))
(check-sat)
(exit)