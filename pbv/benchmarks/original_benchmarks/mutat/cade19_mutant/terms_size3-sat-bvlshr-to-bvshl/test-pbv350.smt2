(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl s (bvshl t (bvnot t))) (bvshl s (bvshl t (bvneg t)))))
(check-sat)
(exit)