(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl s (bvlshr (bvneg s) s)) (bvshl s (bvlshr (bvneg s) s))))
(check-sat)
(exit)