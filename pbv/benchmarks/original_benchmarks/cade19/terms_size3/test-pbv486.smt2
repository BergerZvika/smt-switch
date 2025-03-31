(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl s (bvshl t (bvshl t t))) (bvlshr s (bvshl t (bvshl t t)))))
(check-sat)
(exit)