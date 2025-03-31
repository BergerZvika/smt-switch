(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvand s (bvshl s (bvnot s))) (bvshl s (bvnot s)))))
(check-sat)
(exit)