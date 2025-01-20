(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (distinct s (bvshl (bvmul t t) (_ bv0 k))) (distinct s (bvmul t (bvshl t (_ bv1 k))))))
(check-sat)