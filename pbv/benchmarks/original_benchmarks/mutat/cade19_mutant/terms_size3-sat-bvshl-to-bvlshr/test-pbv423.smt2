(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvor s (bvor t (bvlshr s t))) (bvor s (bvadd t (bvshl s t)))))
(check-sat)
(exit)