(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvand s (bvudiv s (bvudiv (_ bvk k) t))) (bvudiv s (bvudiv t t))))
(check-sat)
