(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvule s (bvshl (bvadd s t) s)) (bvule s (bvmul s (bvshl t s)))))
(check-sat)
