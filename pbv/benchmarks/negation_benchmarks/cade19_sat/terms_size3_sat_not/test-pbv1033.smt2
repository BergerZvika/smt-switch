(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvadd t (bvadd s (bvshl s s))) (bvadd s (bvadd t (bvshl s s))))))
(check-sat)
(exit)