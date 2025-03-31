(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (= s (bvand (int_to_pbv k 0) t)) (= s (int_to_pbv k 0)))))
(check-sat)
(exit)