(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvnot (bvand s (bvnot t))) (bvor (bvnot s) t))))
(check-sat)
(exit)