(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvor (bvor s (bvshl t t)) t) (bvadd (bvand s (bvshl t t)) t)))
(check-sat)
(exit)