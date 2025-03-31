(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr (bvmul s (bvnot t)) t) (bvmul s (bvshl (bvnot t) t))))
(check-sat)
(exit)