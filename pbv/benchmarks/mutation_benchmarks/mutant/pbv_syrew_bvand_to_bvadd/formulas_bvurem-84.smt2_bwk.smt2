(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (= s (bvurem s (bvadd s t))) (= (_ bv0 k) (bvand s t))))
(check-sat)
