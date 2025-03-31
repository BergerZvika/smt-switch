(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvor (bvneg (bvshl s t)) t) (bvsub (bvneg (bvshl s t)) t)))
(check-sat)
(exit)