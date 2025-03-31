(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvadd s (bvshl t s)) s) (bvlshr (bvshl t s) s)))
(check-sat)
(exit)