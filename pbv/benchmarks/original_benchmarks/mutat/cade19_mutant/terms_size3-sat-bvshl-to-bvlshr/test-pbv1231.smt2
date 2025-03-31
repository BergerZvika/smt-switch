(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvor (bvlshr s s) (bvor s t)) (bvor s (bvor t (bvshl s s)))))
(check-sat)
(exit)