(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr (bvshl s (bvadd s s)) t) (bvshl (bvshl s t) (bvadd s s))))
(check-sat)
(exit)