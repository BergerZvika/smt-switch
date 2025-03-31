(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvand s (bvlshr t (bvor s t))) (int_to_pbv k 0))))
(check-sat)
(exit)