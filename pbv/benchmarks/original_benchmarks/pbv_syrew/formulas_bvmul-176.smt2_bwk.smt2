(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (distinct s (bvshl (bvand t (_ bv1 k)) t)) (distinct s (bvmul t (bvshl t t)))))
(check-sat)
