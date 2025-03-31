(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvadd s (bvand (bvmul t t) t)) (bvadd s (bvand t (bvmul t t))))))
(check-sat)
(exit)