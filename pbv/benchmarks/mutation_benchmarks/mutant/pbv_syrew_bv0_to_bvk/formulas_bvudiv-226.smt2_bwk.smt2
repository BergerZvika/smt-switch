(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvule s (bvshl t (bvudiv (_ bvk k) s))) (bvule s t)))
(check-sat)
