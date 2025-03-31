(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl s (bvshl (bvneg s) s)) (bvlshr s (bvshl (bvnot s) s))))
(check-sat)
(exit)