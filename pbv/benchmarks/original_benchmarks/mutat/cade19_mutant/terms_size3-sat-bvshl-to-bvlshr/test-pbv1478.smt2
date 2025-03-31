(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr (bvshl s (bvshl t s)) t) (bvshl s (bvor t (bvshl t s)))))
(check-sat)
(exit)