(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr (bvshl s (bvneg s)) t) (bvshl (bvshl s t) (bvneg s))))
(check-sat)
(exit)