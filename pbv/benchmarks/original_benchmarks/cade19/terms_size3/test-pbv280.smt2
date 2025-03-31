(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl s (bvshl s (bvadd s s))) (bvlshr s (bvshl s (bvadd s s)))))
(check-sat)
(exit)