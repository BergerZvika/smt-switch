(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvand t (bvnot (int_to_pbv k 0))) t) (bvshl (bvnot (bvlshr s s)) t)))
(check-sat)
(exit)