(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvslt (bvand s (int_to_pbv k 0)) t) (bvslt (bvlshr s s) t))))
(check-sat)
(exit)