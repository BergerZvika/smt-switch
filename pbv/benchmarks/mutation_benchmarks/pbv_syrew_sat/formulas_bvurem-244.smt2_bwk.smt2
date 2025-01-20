(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (not (distinct (bvult s (bvand t (bvurem (_ bv1 k) s))) (bvult s (bvand t (_ bv1 k))))))
(check-sat)
