(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvult s (bvshl (bvadd t (_ bv1 k)) t)) (bvult s (bvmul t (bvshl t t)))))
(check-sat)
