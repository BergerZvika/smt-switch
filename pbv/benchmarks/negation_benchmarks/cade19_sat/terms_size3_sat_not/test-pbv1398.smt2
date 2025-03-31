(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvlshr (bvlshr s (bvnot s)) t) (bvlshr (bvlshr s t) (bvnot s)))))
(check-sat)
(exit)