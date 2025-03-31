(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr s (bvshl (bvshl t s) t)) (bvlshr s (bvshl (bvshl t s) t))))
(check-sat)
(exit)