(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvshl s (bvshl (bvnot s) s)) (bvlshr s (bvshl (bvnot s) s)))))
(check-sat)
(exit)