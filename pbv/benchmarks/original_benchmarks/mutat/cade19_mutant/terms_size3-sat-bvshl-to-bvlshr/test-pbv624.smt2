(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr s (bvshl (bvnot t) t)) (bvlshr s (bvshl (bvnot t) t))))
(check-sat)
(exit)