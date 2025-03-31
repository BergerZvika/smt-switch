(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand s (bvshl (bvmul t t) t)) (bvor s (bvmul t (bvshl t t)))))
(check-sat)
(exit)