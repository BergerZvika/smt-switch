(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvlshr s t) (bvshl t s)) (bvlshr s (bvand t (bvshl t s)))))
(check-sat)
(exit)