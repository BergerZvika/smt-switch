(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvshl (bvand s (bvmul s s)) s) (bvmul s (bvshl s s)))))
(check-sat)
(exit)