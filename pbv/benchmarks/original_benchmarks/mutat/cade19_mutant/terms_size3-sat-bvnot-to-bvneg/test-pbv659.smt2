(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl s (bvshl (bvneg (int_to_pbv k 0)) t)) (bvlshr s (bvshl (bvnot (int_to_pbv k 0)) t))))
(check-sat)
(exit)