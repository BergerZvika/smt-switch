(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvlshr s (bvor t (bvudiv t t))) (bvlshr s (bvand t (_ bv1 k)))))
(check-sat)
