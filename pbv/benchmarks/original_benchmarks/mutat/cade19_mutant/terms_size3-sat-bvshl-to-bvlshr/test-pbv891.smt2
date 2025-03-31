(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvadd s (bvlshr (bvshl t t) t)) (bvadd s (bvshl (bvadd t t) t))))
(check-sat)
(exit)