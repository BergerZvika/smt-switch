(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr s (bvlshr (bvshl s s) s)) (bvlshr s (bvlshr (bvnot s) s))))
(check-sat)
(exit)