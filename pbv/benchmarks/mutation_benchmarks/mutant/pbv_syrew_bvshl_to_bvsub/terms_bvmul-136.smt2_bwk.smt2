(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvmul s (bvsub (bvshl t (_ bv1 k)) t)) (bvmul s (bvshl (bvshl t t) t))))
(check-sat)
