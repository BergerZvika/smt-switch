(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvshl s (bvmul (bvnot t) t)) (bvshl s (bvmul t (bvnot t))))))
(check-sat)
(exit)