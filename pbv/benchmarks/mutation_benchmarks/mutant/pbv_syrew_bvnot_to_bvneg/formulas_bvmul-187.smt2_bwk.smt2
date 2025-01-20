(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (distinct t (bvmul s (bvneg (_ bv0 k)))) (distinct s (bvmul t (bvnot (_ bv0 k))))))
(check-sat)
