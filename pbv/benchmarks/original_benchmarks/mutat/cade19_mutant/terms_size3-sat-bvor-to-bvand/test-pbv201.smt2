(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvneg (bvand (bvneg t) (int_to_pbv k 0))) (bvadd (bvlshr s s) t)))
(check-sat)
(exit)