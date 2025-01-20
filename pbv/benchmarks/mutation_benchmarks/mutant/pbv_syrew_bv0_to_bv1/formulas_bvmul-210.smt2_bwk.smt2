(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (= (_ bv1 k) (bvnot (bvmul t t))) (distinct s s)))
(check-sat)