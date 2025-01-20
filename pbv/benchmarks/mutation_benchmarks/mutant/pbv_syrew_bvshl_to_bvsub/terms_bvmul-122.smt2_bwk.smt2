(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvsub s (bvshl (bvmul t t) t)) (bvshl s (bvmul t (bvshl t t)))))
(check-sat)
