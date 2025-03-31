(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvadd s (bvlshr (bvneg t) t)) (bvadd s (bvneg (bvshl t t)))))
(check-sat)
(exit)