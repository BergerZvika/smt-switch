(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (not (distinct (bvmul s (bvlshr (_ bv1 k) (bvshl t s))) (bvlshr s (bvshl t s)))))
(check-sat)
