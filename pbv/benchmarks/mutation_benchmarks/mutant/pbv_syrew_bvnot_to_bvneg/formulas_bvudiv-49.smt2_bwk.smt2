(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvult s (bvneg (bvudiv (_ bv0 k) s))) (distinct s (bvnot (bvudiv (_ bv0 k) s)))))
(check-sat)
