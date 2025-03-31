(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvadd s (bvnot (bvnot s))) (bvnot (bvneg (bvadd s s)))))
(check-sat)
(exit)