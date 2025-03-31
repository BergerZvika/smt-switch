(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvshl s (bvmul (bvadd t t) t)) (bvshl s (bvmul t (bvadd t t))))))
(check-sat)
(exit)