(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvor (bvand s t) (bvadd t t)) (bvand s (bvand t (bvadd t t)))))
(check-sat)
(exit)