(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvsub s s) (bvnot s)) (bvshl s (bvneg s))))
(check-sat)
(exit)