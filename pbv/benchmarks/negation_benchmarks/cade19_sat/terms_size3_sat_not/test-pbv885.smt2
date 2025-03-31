(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvadd s (bvor (bvshl t t) t)) (bvadd s (bvadd t (bvshl t t))))))
(check-sat)
(exit)