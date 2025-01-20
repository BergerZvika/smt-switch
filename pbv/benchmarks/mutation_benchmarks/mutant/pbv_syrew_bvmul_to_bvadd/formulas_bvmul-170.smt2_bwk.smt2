(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvule s (bvshl (bvadd t t) t)) (bvule s (bvmul t (bvshl t t)))))
(check-sat)
