(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvmul s (bvsub (bvlshr (_ bv1 k) t) t)) (bvmul s (bvlshr (_ bv1 k) t))))
(check-sat)
