(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr (bvlshr (bvnot s) s) s) (bvshl (bvnot (int_to_pbv k 0)) s)))
(check-sat)
(exit)