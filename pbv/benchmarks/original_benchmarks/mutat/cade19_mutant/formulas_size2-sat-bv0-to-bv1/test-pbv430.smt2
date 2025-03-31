(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (or (= (int_to_pbv k 1) t) false) (= s (bvadd s t))))
(check-sat)
(exit)