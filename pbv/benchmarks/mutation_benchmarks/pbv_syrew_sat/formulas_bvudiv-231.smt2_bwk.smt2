(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (not (distinct (bvult s (bvudiv t (bvudiv (_ bv0 k) s))) (distinct s (bvudiv t (bvudiv (_ bv0 k) s))))))
(check-sat)
