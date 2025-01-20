(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvadd (bvnot (_ bv0 k)) (bvshl s t)) (bvmul s (bvshl (bvnot (_ bv0 k)) t))))
(check-sat)
