(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvnot (bvadd s (bvneg t))) (bvadd (bvnot s) t)))
(check-sat)
(exit)