(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (= s (bvand (_ bv1 k) (bvadd s t))) (bvule s (bvand t (_ bv1 k)))))
(check-sat)
