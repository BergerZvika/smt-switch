(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr (bvmul s (bvnot s)) t) (bvmul s (bvshl (bvnot s) t))))
(check-sat)
(exit)