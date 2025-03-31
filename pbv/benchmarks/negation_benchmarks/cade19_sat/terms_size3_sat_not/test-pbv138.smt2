(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvshl (bvneg s) t) (bvneg (bvshl s t)))))
(check-sat)
(exit)