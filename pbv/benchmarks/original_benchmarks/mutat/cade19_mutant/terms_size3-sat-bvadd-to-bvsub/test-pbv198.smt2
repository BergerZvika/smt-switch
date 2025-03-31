(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvnot (bvor (int_to_pbv k 0) (bvnot t))) (bvsub (bvlshr s s) t)))
(check-sat)
(exit)