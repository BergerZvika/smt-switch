(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl s (bvshl s (bvnot s))) (bvshl s (bvshl s (bvneg s)))))
(check-sat)
(exit)