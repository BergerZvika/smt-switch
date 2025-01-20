(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvlshr s (bvshl s (bvudiv (_ bvk k) t))) (bvand s (bvudiv (_ bv0 k) t))))
(check-sat)
