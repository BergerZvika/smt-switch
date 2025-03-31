(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl t (bvnot (bvand s t))) (bvlshr s (bvnot (bvand s t)))))
(check-sat)
(exit)