(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl t (bvlshr (bvand t (int_to_pbv k 0)) s)) (bvsub (bvlshr s s) t)))
(check-sat)
(exit)