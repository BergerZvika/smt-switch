(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (= (int_to_pbv k 1) (bvadd s t)) (= s (bvneg t))))
(check-sat)
(exit)