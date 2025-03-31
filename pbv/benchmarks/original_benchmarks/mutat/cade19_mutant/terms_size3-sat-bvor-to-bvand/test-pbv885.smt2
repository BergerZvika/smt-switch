(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvadd s (bvand (bvshl t t) t)) (bvadd s (bvadd t (bvshl t t)))))
(check-sat)
(exit)