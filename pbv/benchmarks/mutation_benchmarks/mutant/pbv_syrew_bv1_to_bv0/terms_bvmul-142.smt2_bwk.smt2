(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvmul s (bvshl (bvlshr (_ bv0 k) s) t)) (_ bv0 k)))
(check-sat)
