(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvshl s (bvurem (bvnot (_ bvk k)) t)) (bvshl s (bvurem (bvnot t) t))))
(check-sat)
