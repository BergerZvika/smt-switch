(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvand s (bvudiv t (bvshl s t))) (bvand s (bvshl s (bvshl s t)))))
(check-sat)
