(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvadd s (bvshl t (bvudiv t t))) (bvand s (bvshl t (_ bv1 k)))))
(check-sat)
