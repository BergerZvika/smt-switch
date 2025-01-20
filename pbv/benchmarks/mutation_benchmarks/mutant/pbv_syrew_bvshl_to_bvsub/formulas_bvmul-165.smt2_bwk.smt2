(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvult s (bvsub (bvmul t t) s)) (bvult s (bvmul t (bvshl t s)))))
(check-sat)
