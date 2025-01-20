(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (not (distinct (bvule s (bvshl t (bvudiv s s))) (bvule s (bvshl t (_ bv1 k))))))
(check-sat)
