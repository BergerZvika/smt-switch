(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl s (bvshl s (bvshl s s))) (bvlshr s (bvshl s (bvshl s s)))))
(check-sat)
(exit)