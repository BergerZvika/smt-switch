(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvmul (bvnot s) (bvsub s t)) (bvmul s (bvshl (bvnot s) t))))
(check-sat)