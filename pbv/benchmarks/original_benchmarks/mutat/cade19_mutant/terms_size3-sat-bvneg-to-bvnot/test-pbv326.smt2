(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr s (bvmul t (bvnot t))) (bvlshr s (bvneg (bvmul t t)))))
(check-sat)
(exit)