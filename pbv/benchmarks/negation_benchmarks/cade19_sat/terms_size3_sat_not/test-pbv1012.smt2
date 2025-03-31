(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvadd t (bvneg (bvand s t))) (bvand (bvnot s) t))))
(check-sat)
(exit)