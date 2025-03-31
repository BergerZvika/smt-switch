(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvult (bvnot t) s) (bvult (bvnot s) t))))
(check-sat)
(exit)