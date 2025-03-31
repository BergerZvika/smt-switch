(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr (bvshl (bvlshr s t) t) t) (bvlshr s t)))
(check-sat)
(exit)