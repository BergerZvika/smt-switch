(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr (bvshl s t) (bvlshr s t)) (bvshl s (bvadd t (bvlshr s t)))))
(check-sat)
(exit)