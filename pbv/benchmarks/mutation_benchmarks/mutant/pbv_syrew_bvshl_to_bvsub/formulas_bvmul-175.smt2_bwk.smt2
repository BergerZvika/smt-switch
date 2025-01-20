(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvule s (bvsub (bvmul t t) (_ bv1 k))) (bvule s (bvmul t (bvshl t (_ bv1 k))))))
(check-sat)
