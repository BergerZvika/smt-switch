(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvule s (bvshl (bvadd s t) t)) (bvule s (bvmul s (bvshl t t)))))
(check-sat)
