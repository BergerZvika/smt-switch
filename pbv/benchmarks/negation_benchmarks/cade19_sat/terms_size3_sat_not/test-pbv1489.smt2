(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvshl (bvadd s (bvshl t t)) t) (bvshl (bvadd s (bvadd t t)) t))))
(check-sat)
(exit)