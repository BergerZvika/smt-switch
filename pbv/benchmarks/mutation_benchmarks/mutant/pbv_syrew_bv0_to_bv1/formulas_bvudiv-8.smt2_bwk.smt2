(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvult s (bvudiv (_ bv1 k) t)) (bvult s (bvudiv s t))))
(check-sat)
