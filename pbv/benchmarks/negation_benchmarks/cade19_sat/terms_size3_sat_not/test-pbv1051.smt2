(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvadd t (bvadd s (bvand s t))) (bvadd s (bvadd t (bvand s t))))))
(check-sat)
(exit)