(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvadd s (bvnot (bvand s t))) (bvand s (bvnot t))))
(check-sat)
(exit)