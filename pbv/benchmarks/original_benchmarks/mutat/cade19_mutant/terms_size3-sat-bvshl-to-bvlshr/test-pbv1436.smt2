(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr (bvshl s (bvshl s s)) t) (bvshl (bvshl s t) (bvshl s s))))
(check-sat)
(exit)