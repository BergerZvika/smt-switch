(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand s (bvmul (bvsub t t) t)) (bvand s (bvmul t (bvadd t t)))))
(check-sat)
(exit)