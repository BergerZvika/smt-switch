(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (= (_ bv0 k) (bvmul s (bvlshr s (_ bv1 k)))) (bvule s (bvsub s (bvshl s (_ bv1 k))))))
(check-sat)
