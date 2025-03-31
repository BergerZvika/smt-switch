(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr s (bvor (bvand t (int_to_pbv k 1)) s)) (int_to_pbv k 0)))
(check-sat)
(exit)