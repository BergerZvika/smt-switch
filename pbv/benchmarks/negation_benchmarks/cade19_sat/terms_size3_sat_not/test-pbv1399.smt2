(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvshl (bvshl s (bvnot s)) t) (bvshl (bvshl s t) (bvnot s)))))
(check-sat)
(exit)