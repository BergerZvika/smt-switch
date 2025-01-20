(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvor s (bvudiv t (bvudiv t t))) (bvand s t)))
(check-sat)
