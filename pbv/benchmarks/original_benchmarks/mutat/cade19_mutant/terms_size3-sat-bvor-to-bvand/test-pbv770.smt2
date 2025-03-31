(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl s (bvand (bvadd t t) t)) (bvshl s (bvor t (bvadd t t)))))
(check-sat)
(exit)