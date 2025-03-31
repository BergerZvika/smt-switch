(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (and (= (int_to_pbv k 0) t) true) (= s (bvsub s t))))
(check-sat)
(exit)