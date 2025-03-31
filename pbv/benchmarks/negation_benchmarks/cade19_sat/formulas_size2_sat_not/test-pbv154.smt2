(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvule s (bvshl (int_to_pbv k 0) s)) (= s (int_to_pbv k 0)))))
(check-sat)
(exit)