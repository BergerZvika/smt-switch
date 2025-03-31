(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvlshr s (bvadd s s)) s) (int_to_pbv k 0)))
(check-sat)
(exit)