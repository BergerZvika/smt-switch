(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvor s (bvneg (bvlshr s s))) (bvadd s (bvneg (bvshl s s)))))
(check-sat)
(exit)