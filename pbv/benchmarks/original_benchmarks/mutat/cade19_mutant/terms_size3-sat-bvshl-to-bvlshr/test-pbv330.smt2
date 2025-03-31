(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr s (bvshl t (bvneg t))) (bvlshr s (bvshl t (bvneg t)))))
(check-sat)
(exit)