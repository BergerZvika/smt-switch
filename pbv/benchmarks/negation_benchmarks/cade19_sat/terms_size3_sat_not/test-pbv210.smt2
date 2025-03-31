(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvadd s (bvnot (bvneg t))) (bvnot (bvneg (bvadd s t))))))
(check-sat)
(exit)