(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand s (bvadd (int_to_pbv k 1) t)) (bvand s t)))
(check-sat)
(exit)