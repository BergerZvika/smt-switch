(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvlshr s t) (bvnot t)) (bvlshr s (bvor t (bvneg t)))))
(check-sat)
(exit)