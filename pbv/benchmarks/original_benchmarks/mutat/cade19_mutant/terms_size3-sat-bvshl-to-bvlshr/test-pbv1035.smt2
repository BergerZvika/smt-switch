(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvor t (bvadd s (bvlshr s s))) (bvor s (bvor t (bvshl s s)))))
(check-sat)
(exit)