(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvsub s s) (bvnot t)) (bvand t (bvshl s (bvneg t)))))
(check-sat)
(exit)