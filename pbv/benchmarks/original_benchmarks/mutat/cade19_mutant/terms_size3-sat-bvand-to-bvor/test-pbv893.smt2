(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvor s (bvshl (bvshl t t) t)) (bvand s (bvshl (bvadd t t) t))))
(check-sat)
(exit)