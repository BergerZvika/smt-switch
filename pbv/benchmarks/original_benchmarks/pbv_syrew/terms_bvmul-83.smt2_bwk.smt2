(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvmul s (bvand (_ bv1 k) (bvshl t s))) (_ bv0 k)))
(check-sat)
