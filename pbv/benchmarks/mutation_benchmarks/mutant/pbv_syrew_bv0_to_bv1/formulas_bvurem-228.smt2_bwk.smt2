(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (= s (bvshl t (bvurem (_ bv1 k) t))) (= s t)))
(check-sat)
