(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvurem s (bvor (_ bv1 k) (bvurem (_ bv1 k) t))) (bvurem s (bvurem (_ bv1 k) t))))
(check-sat)
