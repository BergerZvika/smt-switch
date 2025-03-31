(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand t (bvmul (bvlshr t t) s)) (bvadd (bvlshr s s) t)))
(check-sat)
(exit)