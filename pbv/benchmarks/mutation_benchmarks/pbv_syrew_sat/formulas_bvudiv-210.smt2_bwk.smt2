(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (not (distinct (distinct s (bvshl t (bvudiv t t))) (distinct s (bvshl t (_ bv1 k))))))
(check-sat)
