(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvlshr s (bvudiv t (bvlshr (_ bv0 k) t))) (bvand s (bvudiv (_ bv0 k) t))))
(check-sat)
