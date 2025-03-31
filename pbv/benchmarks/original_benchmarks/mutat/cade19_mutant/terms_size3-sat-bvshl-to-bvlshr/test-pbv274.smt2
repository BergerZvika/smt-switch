(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr s (bvshl s (bvneg s))) (bvlshr s (bvshl s (bvneg s)))))
(check-sat)
(exit)