(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr (bvlshr s (bvneg s)) t) (bvlshr (bvlshr s t) (bvneg s))))
(check-sat)
(exit)