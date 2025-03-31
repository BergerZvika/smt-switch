(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvsle s (bvneg s)) (bvsle s (int_to_pbv k 1))))
(check-sat)
(exit)