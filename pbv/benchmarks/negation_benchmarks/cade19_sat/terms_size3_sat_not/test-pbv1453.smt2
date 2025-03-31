(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvor (bvshl s (bvor s t)) t) (bvadd (bvshl s (bvor s t)) t))))
(check-sat)
(exit)