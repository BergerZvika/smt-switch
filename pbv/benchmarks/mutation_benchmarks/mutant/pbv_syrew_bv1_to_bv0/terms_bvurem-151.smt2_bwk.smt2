(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvurem s (bvand (_ bv0 k) (bvnot t))) (bvlshr s (bvurem s (bvand t (_ bv1 k))))))
(check-sat)
