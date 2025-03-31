(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr (bvmul s t) (bvnot s)) (bvmul s (bvshl t (bvnot s)))))
(check-sat)
(exit)