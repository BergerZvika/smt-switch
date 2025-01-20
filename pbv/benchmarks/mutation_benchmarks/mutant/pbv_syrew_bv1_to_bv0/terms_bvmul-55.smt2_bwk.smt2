(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvand s (bvmul t (bvlshr (_ bv0 k) s))) (_ bv0 k)))
(check-sat)
