(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr (bvlshr (bvneg t) s) t) (bvlshr (bvlshr (bvnot s) s) t)))
(check-sat)
(exit)