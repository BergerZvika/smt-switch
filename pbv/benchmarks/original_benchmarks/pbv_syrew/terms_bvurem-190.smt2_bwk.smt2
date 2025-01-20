(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvlshr s (bvand (_ bv1 k) (bvurem t (_ bv0 k)))) (bvlshr s (bvand t (_ bv1 k)))))
(check-sat)
