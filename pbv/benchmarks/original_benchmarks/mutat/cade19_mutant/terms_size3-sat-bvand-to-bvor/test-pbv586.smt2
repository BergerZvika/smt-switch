(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl s (bvor (bvneg t) t)) (bvshl s (bvand t (bvneg t)))))
(check-sat)
(exit)