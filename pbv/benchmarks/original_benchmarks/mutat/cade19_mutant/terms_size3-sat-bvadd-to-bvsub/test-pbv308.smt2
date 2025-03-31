(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvsub s (bvadd t (bvnot s))) (bvnot (bvneg t))))
(check-sat)
(exit)