(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvshl (bvneg s) t) s) (bvshl (bvshl (bvnot s) s) t)))
(check-sat)
(exit)