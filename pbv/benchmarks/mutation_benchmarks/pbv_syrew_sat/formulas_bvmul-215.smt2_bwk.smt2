(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (not (distinct (distinct (_ bv0 k) (bvshl s (bvshl s s))) (distinct s (bvmul s (bvlshr s (_ bv1 k)))))))
(check-sat)