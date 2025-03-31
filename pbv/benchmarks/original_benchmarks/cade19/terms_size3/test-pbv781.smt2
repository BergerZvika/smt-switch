(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl s (bvadd (bvmul t t) t)) (bvshl s (bvadd t (bvmul t t)))))
(check-sat)
(exit)