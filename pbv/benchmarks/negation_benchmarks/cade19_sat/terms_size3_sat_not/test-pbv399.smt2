(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvadd s (bvand t (bvor s t))) (bvadd s t))))
(check-sat)
(exit)