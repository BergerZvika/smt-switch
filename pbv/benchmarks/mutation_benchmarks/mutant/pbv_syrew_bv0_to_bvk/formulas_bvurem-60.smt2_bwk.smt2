(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (= s (bvnot (bvurem t (_ bvk k)))) (= s (bvnot t))))
(check-sat)