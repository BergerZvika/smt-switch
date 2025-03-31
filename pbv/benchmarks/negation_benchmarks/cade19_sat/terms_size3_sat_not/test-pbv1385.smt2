(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvlshr (bvnot (bvor s t)) t) (bvlshr (bvnot s) t))))
(check-sat)
(exit)