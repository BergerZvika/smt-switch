(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvshl s (bvnot (bvurem t (_ bvk k)))) (bvshl s (bvnot t))))
(check-sat)
