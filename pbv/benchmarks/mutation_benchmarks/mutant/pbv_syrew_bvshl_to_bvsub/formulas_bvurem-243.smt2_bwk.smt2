(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (= s (bvand t (bvurem (_ bv1 k) s))) (= s (bvand t (bvsub (_ bv1 k) s)))))
(check-sat)
