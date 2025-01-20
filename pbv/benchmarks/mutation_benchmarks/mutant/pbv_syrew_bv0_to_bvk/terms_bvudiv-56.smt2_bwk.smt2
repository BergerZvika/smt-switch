(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvlshr s (bvnot (bvudiv t t))) (bvand s (bvudiv (_ bvk k) t))))
(check-sat)