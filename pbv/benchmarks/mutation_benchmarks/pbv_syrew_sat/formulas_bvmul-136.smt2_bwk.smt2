(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (not (distinct (= s (bvshl (bvmul s s) t)) (bvule s (bvlshr (_ bv1 k) t)))))
(check-sat)
