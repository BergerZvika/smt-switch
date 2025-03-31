(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl s (bvshl (bvadd t t) s)) (bvshl s (bvshl (bvadd t t) s))))
(check-sat)
(exit)