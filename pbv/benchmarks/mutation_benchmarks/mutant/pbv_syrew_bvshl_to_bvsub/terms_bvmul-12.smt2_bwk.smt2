(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvsub (bvmul s t) t) (bvmul s (bvshl t t))))
(check-sat)