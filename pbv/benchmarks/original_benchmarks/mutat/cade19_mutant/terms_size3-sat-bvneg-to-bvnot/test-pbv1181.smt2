(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvor (bvnot s) (bvshl s s)) (bvneg s)))
(check-sat)
(exit)