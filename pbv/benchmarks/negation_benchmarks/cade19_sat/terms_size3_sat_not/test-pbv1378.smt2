(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvlshr (bvnot (bvneg s)) s) (bvlshr (bvnot s) (bvneg s)))))
(check-sat)
(exit)