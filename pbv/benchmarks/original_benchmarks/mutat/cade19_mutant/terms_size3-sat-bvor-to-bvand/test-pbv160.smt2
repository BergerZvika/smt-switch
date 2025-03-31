(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand (bvshl s t) t) (bvadd (bvshl s t) t)))
(check-sat)
(exit)