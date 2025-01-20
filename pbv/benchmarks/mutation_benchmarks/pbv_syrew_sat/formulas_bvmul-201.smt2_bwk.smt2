(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (not (distinct (distinct t (bvand (_ bv1 k) (bvmul s t))) (bvult (bvand s (_ bv1 k)) t))))
(check-sat)
