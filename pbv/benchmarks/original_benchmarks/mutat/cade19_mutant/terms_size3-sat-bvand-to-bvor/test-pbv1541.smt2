(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvor (bvadd s t) t) t) (bvshl (bvand (bvnot s) t) t)))
(check-sat)
(exit)