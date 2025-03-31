(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvadd s (bvneg (bvadd s t))) (bvneg (bvadd (bvshl s s) t))))
(check-sat)
(exit)