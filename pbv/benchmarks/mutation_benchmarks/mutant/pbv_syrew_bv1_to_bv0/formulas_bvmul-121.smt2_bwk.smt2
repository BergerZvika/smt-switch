(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvule s (bvlshr (_ bv0 k) (bvmul s t))) (bvule s (bvlshr (_ bv1 k) t))))
(check-sat)
