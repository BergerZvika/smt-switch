(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (not (distinct (bvlshr s (bvshl (bvlshr t s) s)) (bvlshr s (bvmul s (bvlshr t s))))))
(check-sat)
