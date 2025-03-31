(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvor t (bvor s (bvshl s t))) (bvor s (bvsub t (bvshl s t)))))
(check-sat)
(exit)