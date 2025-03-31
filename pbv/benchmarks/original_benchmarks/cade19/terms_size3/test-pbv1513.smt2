(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr (bvlshr (bvnot s) t) s) (bvlshr (bvlshr (bvnot s) s) t)))
(check-sat)
(exit)