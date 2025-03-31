(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvneg (bvor (bvneg t) (int_to_pbv k 0))) (bvadd (bvshl s s) t)))
(check-sat)
(exit)