(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (distinct s (bvsub (bvmul t t) s)) (distinct s (bvmul t (bvshl t s)))))
(check-sat)
