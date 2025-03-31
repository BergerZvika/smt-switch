(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvshl (bvshl s (bvshl s t)) t) (bvshl s (bvadd t (bvshl s t))))))
(check-sat)
(exit)