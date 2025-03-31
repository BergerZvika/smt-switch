(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvlshr s t) (bvshl s t)) (bvlshr s (bvadd t (bvshl s t)))))
(check-sat)
(exit)