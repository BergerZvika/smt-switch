(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (= s (bvsub (bvand t (_ bv1 k)) t)) (= s (bvmul t (bvshl t t)))))
(check-sat)
