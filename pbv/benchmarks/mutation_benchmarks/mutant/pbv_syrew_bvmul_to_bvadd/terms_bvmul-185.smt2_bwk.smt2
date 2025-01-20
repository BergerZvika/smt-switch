(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvand (_ bv1 k) (bvadd s (bvlshr s t))) (bvand s (bvand (_ bv1 k) (bvlshr s t)))))
(check-sat)