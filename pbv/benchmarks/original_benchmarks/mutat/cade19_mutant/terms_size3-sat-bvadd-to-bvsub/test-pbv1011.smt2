(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand t (bvnot (bvneg s))) (bvsub s (bvor t (bvneg s)))))
(check-sat)
(exit)