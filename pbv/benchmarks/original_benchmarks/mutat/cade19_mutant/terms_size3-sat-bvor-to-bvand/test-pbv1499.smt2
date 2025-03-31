(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvand s (bvshl t t)) t) (bvshl (bvor s (bvadd t t)) t)))
(check-sat)
(exit)