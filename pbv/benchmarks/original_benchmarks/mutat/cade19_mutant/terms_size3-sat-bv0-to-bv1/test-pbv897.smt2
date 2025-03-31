(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvadd s (bvadd (bvmul t (int_to_pbv k 1)) s)) (bvadd s s)))
(check-sat)
(exit)