(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvshl (bvnot s) s) s) (bvlshr (bvnot (bvshl s s)) s)))
(check-sat)
(exit)