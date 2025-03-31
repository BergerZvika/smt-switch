(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvor t (bvor s (bvlshr s t))) (bvor s (bvor t (bvlshr s t)))))
(check-sat)
(exit)