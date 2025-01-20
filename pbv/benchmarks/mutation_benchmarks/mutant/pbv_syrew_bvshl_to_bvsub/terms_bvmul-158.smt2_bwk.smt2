(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvmul t (bvsub s (bvlshr s t))) (bvmul s (bvshl t (bvlshr s t)))))
(check-sat)
