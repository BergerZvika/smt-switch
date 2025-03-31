(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvnot (bvlshr s s)) t) (bvlshr (bvnot t) t)))
(check-sat)
(exit)