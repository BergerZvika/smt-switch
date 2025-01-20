(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvand s (bvudiv t (bvlshr (_ bv1 k) t))) (bvsub s (bvudiv (_ bv0 k) t))))
(check-sat)