(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvsle (bvlshr (int_to_pbv k 0) s) t) (bvsle (bvlshr s s) t))))
(check-sat)
(exit)