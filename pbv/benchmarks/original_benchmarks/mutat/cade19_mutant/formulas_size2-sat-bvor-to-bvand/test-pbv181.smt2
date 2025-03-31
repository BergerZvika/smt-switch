(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvsle s (bvand (int_to_pbv k 0) t)) (bvsle s t)))
(check-sat)
(exit)