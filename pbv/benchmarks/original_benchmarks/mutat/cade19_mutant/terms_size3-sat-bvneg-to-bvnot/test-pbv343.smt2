(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvadd s (bvor t (bvnot t))) (bvnot (bvnot s))))
(check-sat)
(exit)