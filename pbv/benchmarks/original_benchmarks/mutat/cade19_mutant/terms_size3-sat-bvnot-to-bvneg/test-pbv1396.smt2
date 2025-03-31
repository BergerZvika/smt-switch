(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvmul s (bvneg s)) t) (bvmul s (bvshl (bvnot s) t))))
(check-sat)
(exit)