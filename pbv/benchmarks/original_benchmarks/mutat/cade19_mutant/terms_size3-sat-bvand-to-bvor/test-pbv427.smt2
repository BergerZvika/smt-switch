(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvor s (bvadd t (bvshl t s))) (bvand s t)))
(check-sat)
(exit)