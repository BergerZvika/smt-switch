(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (distinct s (bvshl s (bvneg s))) (distinct s (bvnot (bvudiv (_ bv0 k) s)))))
(check-sat)
