(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvule s (bvadd t (bvudiv s t))) (= s (bvand t (bvudiv s t)))))
(check-sat)