(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (= (_ bv0 k) (bvshl s (bvshl s s))) (= s (bvmul s (bvlshr s (_ bv0 k))))))
(check-sat)
