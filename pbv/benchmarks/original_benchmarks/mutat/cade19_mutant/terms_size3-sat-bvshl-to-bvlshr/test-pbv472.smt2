(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr s (bvadd t (bvshl t t))) (bvshl s (bvor t (bvadd t t)))))
(check-sat)
(exit)