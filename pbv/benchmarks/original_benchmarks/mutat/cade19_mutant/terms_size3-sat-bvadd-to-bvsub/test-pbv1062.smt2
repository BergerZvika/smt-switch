(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvsub t (bvadd s (bvshl s t))) (bvadd s (bvadd t (bvshl s t)))))
(check-sat)
(exit)