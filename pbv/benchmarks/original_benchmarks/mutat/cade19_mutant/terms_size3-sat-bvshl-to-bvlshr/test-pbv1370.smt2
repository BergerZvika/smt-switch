(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr (bvlshr s t) (bvshl t t)) (bvlshr (bvshl s t) (bvadd t t))))
(check-sat)
(exit)