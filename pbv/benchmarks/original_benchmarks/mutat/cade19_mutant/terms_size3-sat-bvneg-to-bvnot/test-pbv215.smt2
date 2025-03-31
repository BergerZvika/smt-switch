(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl s (bvnot (bvmul s s))) (bvlshr s (bvneg (bvmul s s)))))
(check-sat)
(exit)