(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvult s (bvshl t (bvudiv (_ bvk k) t))) (bvult s t)))
(check-sat)