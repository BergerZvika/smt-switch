(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvnot (bvlshr t t)) t) (bvshl (bvnot (bvlshr s s)) t)))
(check-sat)
(exit)