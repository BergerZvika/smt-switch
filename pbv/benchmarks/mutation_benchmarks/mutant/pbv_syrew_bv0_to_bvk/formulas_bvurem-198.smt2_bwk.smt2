(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvule s (bvshl t (bvurem t (_ bvk k)))) (bvule s (bvshl t t))))
(check-sat)
