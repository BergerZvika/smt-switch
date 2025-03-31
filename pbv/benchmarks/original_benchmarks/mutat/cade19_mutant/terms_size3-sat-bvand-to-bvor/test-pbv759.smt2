(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvadd s (bvor (bvadd t t) t)) (bvadd s (bvand t (bvadd t t)))))
(check-sat)
(exit)