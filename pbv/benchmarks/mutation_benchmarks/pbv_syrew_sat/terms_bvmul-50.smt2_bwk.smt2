(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (not (distinct (bvlshr s (bvmul t (bvshl (_ bv1 k) s))) (bvlshr s (bvshl t s)))))
(check-sat)