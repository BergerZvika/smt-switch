(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvadd s (bvand (bvnot t) t)) (bvadd s (bvand t (bvneg t)))))
(check-sat)
(exit)