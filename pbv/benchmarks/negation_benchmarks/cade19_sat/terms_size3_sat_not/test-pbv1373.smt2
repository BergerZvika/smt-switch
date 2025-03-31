(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvlshr (bvshl t s) (bvneg (int_to_pbv k 0))) (bvand (bvnot s) (bvshl t s)))))
(check-sat)
(exit)