(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (or (bvule s t) false) (bvule s t))))
(check-sat)
(exit)