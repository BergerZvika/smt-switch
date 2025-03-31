(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl s (bvlshr (bvneg (int_to_pbv k 0)) t)) (bvshl s (bvlshr (bvnot t) t))))
(check-sat)
(exit)