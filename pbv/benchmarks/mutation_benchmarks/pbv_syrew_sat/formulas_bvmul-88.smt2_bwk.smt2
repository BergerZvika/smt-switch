(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (not (distinct (= s (bvmul t (bvlshr (_ bv1 k) s))) (= s (bvshl t s)))))
(check-sat)