(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvule (bvadd s t) t) (bvule (bvneg s) t))))
(check-sat)
(exit)