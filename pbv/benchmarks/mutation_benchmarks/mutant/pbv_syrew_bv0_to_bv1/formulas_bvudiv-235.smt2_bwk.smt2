(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvult s (bvand t (bvudiv (_ bv1 k) t))) (distinct s s)))
(check-sat)
