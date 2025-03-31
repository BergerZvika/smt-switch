(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr t (bvsub (bvmul t (int_to_pbv k 0)) s)) (bvlshr (bvor s t) s)))
(check-sat)
(exit)