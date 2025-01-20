(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (not (distinct (bvlshr s (bvand s (bvnot (_ bv1 k)))) (bvand s (bvudiv (_ bv1 k) s)))))
(check-sat)