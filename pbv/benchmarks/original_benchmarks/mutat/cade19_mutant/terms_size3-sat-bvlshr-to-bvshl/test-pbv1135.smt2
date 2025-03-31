(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl t (bvmul (bvmul t (int_to_pbv k 0)) s)) (bvadd (bvshl s s) t)))
(check-sat)
(exit)