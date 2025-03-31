(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand t (bvor s (bvmul s s))) (bvor s (bvor t (bvmul s s)))))
(check-sat)
(exit)