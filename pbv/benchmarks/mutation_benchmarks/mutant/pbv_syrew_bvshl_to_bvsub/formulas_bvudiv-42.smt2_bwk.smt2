(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvult (bvudiv (_ bv0 k) s) t) (distinct s (bvsub s t))))
(check-sat)
