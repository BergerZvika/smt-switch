(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (not (distinct (bvshl s (bvshl (bvand t (_ bv1 k)) t)) (bvshl s (bvmul t (bvshl t t))))))
(check-sat)
