(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (distinct s (bvmul t (bvlshr s t))) (distinct s (_ bv0 k))))
(check-sat)
