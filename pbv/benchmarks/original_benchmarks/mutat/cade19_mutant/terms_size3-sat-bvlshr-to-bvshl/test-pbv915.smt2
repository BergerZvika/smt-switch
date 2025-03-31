(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvadd s (bvshl (bvmul t (int_to_pbv k 0)) s)) s))
(check-sat)
(exit)