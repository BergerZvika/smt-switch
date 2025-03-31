(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvadd s (bvnot (bvadd s t))) (bvnot (bvadd (bvlshr s s) t))))
(check-sat)
(exit)