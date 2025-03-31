(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvsub s (bvor s (bvneg s))) (bvand s (bvnot (bvneg s)))))
(check-sat)
(exit)