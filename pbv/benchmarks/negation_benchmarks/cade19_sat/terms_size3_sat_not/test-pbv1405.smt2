(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvadd (bvadd s (bvnot t)) t) (bvnot (bvneg s)))))
(check-sat)
(exit)