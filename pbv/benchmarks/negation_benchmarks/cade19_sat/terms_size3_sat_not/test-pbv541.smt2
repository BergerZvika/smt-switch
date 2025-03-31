(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvadd s (bvlshr t (bvand t (int_to_pbv k 0)))) (bvadd s t))))
(check-sat)
(exit)