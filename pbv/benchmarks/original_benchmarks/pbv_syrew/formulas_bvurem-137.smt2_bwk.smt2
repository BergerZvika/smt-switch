(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (= s (bvand s (bvurem (_ bv1 k) t))) (bvule s (bvurem (_ bv1 k) t))))
(check-sat)
