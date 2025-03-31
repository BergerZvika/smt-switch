(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvand s (bvand t (bvshl t t))) (int_to_pbv k 0))))
(check-sat)
(exit)