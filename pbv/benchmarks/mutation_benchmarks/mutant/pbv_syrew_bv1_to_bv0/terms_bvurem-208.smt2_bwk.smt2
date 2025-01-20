(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvurem s (bvurem (_ bv0 k) (bvand t (_ bv1 k)))) (bvlshr s (bvurem s (bvand t (_ bv1 k))))))
(check-sat)
