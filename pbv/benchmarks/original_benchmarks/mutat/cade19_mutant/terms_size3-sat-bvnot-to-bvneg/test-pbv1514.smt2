(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvlshr (bvneg s) t) t) (bvshl (bvnot (bvlshr s t)) t)))
(check-sat)
(exit)