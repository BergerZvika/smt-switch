(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvand s (bvshl s (bvudiv (_ bvk k) t))) (bvshl s (bvudiv (_ bv0 k) t))))
(check-sat)
