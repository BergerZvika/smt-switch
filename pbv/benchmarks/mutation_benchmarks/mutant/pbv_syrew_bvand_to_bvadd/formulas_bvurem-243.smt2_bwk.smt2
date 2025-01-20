(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (= s (bvadd t (bvurem (_ bv1 k) s))) (= s (bvand t (bvshl (_ bv1 k) s)))))
(check-sat)