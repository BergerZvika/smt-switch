(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvadd s (bvshl t (bvlshr (_ bv1 k) t))) (bvmul s t)))
(check-sat)
