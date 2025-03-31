(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvshl (bvnot (int_to_pbv k 0)) t) s) (bvshl (bvshl (bvnot (int_to_pbv k 0)) s) t)))
(check-sat)
(exit)