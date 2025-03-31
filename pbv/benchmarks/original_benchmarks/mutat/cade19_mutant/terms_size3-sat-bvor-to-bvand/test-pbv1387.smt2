(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand (bvneg (bvshl s t)) t) (bvadd (bvneg (bvshl s t)) t)))
(check-sat)
(exit)