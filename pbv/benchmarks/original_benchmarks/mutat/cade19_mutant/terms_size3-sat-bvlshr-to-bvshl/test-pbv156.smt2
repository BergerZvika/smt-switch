(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand (bvor s t) t) (bvadd (bvshl s s) t)))
(check-sat)
(exit)