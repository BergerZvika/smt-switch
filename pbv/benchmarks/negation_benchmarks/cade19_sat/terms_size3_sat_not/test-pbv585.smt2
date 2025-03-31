(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvor s (bvand (bvneg t) t)) (bvor s (bvand t (bvneg t))))))
(check-sat)
(exit)