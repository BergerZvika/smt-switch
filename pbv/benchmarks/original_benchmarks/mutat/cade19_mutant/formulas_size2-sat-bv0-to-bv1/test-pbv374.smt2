(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvult (bvshl (int_to_pbv k 1) s) t) (bvult (bvlshr s s) t)))
(check-sat)
(exit)