(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvule (bvsub s t) t) (bvule (bvneg s) t)))
(check-sat)
(exit)