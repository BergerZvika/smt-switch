(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (not (distinct (distinct s (bvshl (bvmul t t) t)) (distinct s (bvmul t (bvshl t t))))))
(check-sat)
