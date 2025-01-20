(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (distinct s (bvand (_ bv1 k) (bvlshr s t))) (distinct s (bvadd s (bvshl s t)))))
(check-sat)