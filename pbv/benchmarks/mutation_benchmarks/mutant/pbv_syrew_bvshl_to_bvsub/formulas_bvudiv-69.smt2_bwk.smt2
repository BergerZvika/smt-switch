(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (distinct s (bvudiv s (bvsub s s))) (distinct s (bvnot (_ bv0 k)))))
(check-sat)
