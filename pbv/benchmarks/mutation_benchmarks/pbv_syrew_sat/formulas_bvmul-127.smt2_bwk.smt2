(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (not (distinct (bvult s (bvlshr (_ bv1 k) (bvlshr (_ bv1 k) t))) (bvult s (bvmul t (bvlshr (_ bv1 k) s))))))
(check-sat)
