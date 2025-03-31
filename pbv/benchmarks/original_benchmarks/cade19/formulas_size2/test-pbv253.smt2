(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvult (bvlshr s s) t) (bvult (int_to_pbv k 0) t)))
(check-sat)
(exit)