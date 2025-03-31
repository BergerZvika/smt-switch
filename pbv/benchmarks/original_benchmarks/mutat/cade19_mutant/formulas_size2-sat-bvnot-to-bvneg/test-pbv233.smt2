(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvsle (bvneg t) s) (bvsle (bvnot s) t)))
(check-sat)
(exit)