(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (= t (bvnot (bvmul t t))) (distinct s s)))
(check-sat)
