(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvule s (bvsub (bvmul t t) s)) (bvule s (bvmul t (bvshl t s)))))
(check-sat)
