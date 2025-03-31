(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand t (bvmul s (bvlshr s s))) (bvmul s (bvand t (bvshl s s)))))
(check-sat)
(exit)