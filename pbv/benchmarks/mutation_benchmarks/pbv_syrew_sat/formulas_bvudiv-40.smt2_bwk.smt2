(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (not (distinct (bvult (bvudiv (_ bv0 k) s) s) (distinct s (_ bv0 k)))))
(check-sat)
