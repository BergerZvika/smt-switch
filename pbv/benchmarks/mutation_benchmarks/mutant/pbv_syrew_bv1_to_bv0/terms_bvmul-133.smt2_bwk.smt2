(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvmul s (bvshl (bvand t (_ bv0 k)) t)) (bvmul s (bvmul t (bvshl t t)))))
(check-sat)