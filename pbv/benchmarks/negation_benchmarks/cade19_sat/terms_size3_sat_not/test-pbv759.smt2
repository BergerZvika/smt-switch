(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvadd s (bvand (bvadd t t) t)) (bvadd s (bvand t (bvadd t t))))))
(check-sat)
(exit)