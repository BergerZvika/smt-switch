(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvor s (bvnot (bvshl s s))) (bvnot (bvshl s s)))))
(check-sat)
(exit)