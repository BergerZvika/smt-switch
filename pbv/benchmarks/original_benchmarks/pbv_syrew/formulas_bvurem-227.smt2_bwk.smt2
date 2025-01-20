(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (distinct s (bvshl t (bvurem (_ bv0 k) t))) (distinct s t)))
(check-sat)
