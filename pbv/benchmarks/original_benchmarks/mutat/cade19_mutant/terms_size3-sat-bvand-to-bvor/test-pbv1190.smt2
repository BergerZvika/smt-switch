(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvor (bvnot s) (bvshl t s)) (bvshl t s)))
(check-sat)
(exit)