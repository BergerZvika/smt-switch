(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (distinct (_ bv0 k) (bvlshr s (bvlshr (_ bv1 k) t))) (distinct s (bvmul s (bvsub s t)))))
(check-sat)
