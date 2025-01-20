(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvlshr s (bvmul t (bvshl (_ bv0 k) s))) (bvlshr s (bvshl t s))))
(check-sat)