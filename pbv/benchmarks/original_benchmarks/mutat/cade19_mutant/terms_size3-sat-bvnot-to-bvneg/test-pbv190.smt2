(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvneg (bvadd s (bvnot t))) (bvadd (bvneg s) t)))
(check-sat)
(exit)