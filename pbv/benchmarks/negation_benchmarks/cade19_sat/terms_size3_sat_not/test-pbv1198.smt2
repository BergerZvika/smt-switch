(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvlshr (bvnot (int_to_pbv k 0)) (bvor s t)) (bvlshr (bvnot s) (bvor s t)))))
(check-sat)
(exit)