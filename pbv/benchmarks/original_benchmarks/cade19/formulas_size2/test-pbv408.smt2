(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (or false (= (int_to_pbv k 0) t)) (= s (bvadd s t))))
(check-sat)
(exit)