(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (distinct s (bvadd t (bvshl (_ bv1 k) t))) (distinct s (bvshl t t))))
(check-sat)
