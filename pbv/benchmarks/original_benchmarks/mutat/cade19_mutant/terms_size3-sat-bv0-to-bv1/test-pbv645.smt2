(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvadd s (bvlshr (bvnot (int_to_pbv k 1)) t)) (bvadd s (bvlshr (bvnot t) t))))
(check-sat)
(exit)