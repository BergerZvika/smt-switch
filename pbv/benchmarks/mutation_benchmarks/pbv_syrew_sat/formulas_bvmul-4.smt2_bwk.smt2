(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (not (distinct (bvule s (bvnot (bvmul s s))) (bvult s (bvnot (bvmul s s))))))
(check-sat)
