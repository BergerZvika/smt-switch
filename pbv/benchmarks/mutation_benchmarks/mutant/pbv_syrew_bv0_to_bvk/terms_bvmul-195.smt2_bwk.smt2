(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvand (_ bv1 k) (bvmul s (bvshl t (_ bv1 k)))) (_ bvk k)))
(check-sat)
