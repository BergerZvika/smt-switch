(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvule s (bvshl (bvlshr s (_ bv1 k)) s)) (= s (bvmul s (bvlshr s (_ bv1 k))))))
(check-sat)
