(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvnot (bvand (int_to_pbv k 0) (bvnot t))) (bvadd (bvlshr s s) t)))
(check-sat)
(exit)