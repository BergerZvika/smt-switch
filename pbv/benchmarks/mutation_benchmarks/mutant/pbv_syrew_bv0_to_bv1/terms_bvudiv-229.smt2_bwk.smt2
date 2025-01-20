(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvlshr s (bvlshr (_ bv1 k) (bvnot t))) (bvlshr s (bvudiv t (bvnot (_ bv1 k))))))
(check-sat)
