(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (not (distinct (bvult (bvudiv s t) s) (bvult (bvudiv s s) t))))
(check-sat)
