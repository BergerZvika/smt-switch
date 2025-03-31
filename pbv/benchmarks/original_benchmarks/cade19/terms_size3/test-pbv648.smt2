(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr s (bvlshr (bvnot (int_to_pbv k 0)) t)) (bvlshr s (bvlshr (bvnot t) t))))
(check-sat)
(exit)