(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvshl (bvshl (bvlshr s t) t) t) (bvshl (bvlshr s t) (bvadd t t)))))
(check-sat)
(exit)