(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (not (distinct (bvult s (bvudiv (_ bv0 k) t)) (bvult s (bvudiv s t)))))
(check-sat)
