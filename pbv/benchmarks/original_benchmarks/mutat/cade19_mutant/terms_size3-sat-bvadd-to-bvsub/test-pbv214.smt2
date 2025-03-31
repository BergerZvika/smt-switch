(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvsub s (bvnot (bvadd s s))) (bvnot s)))
(check-sat)
(exit)