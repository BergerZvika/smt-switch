(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvule (bvadd s t) t) (bvule (bvnot s) t)))
(check-sat)
(exit)