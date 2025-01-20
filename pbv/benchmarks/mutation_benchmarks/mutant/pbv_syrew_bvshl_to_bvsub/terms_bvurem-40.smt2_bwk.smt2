(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvsub s (bvnot (bvurem t (_ bv0 k)))) (bvshl s (bvnot t))))
(check-sat)