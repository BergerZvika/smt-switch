(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (not (distinct (bvshl s (bvurem (bvnot (_ bv0 k)) t)) (bvshl s (bvurem (bvnot t) t)))))
(check-sat)
