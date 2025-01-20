(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvurem s (bvor (_ bv1 k) (bvnot s))) (bvlshr s (bvurem s (bvand s (_ bv1 k))))))
(check-sat)
