(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvshl s (bvshl (bvneg t) t)) (bvlshr s (bvneg (bvshl t t))))))
(check-sat)
(exit)